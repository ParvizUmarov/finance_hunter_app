import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:finance_hunter_app/core/core.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionApiService transactionApiService;
  final LocalTransactionDataSource localDb;

  TransactionRepositoryImpl({
    required this.transactionApiService,
    required this.localDb,
  });

  @override
  Future<void> getTransactionByPeriod({
    required int accountId,
    required TransactionPeriodRequestBody requestBody,
    required Result<List<TransactionModel>> result,
  }) async {
    await transactionApiService.getTransactionByPeriod(
      accountId: accountId,
      requestBody: requestBody,
      result: Result(
        onSuccess: (response) async {
          await localDb.cacheTransactions(response);
          result.onSuccess(response);
        },
        onError: (message) async {
          final cachedTransactions = await localDb.getCachedTransactions(
            requestBody.startDate,
            requestBody.endDate,
          );
          result.onSuccess(cachedTransactions);
        },
      ),
    );
  }

  @override
  Future<void> addTransaction({
    required TransactionModel model,
    required Result<TransactionResponseModel> result,
  }) async {
    final localId = DateTime.now().millisecondsSinceEpoch;

    final localCopy = model.copyWith(id: localId);
    await localDb.upsertTransaction(localCopy, SyncState.add);

    final requestBody = TransactionRequestBody(
      accountId: model.account.id,
      categoryId: model.category.id,
      amount: model.amount,
      transactionDate: model.transactionDate,
      comment: model.comment,
    );

    await transactionApiService.addTransaction(
      requestBody: requestBody,
      result: Result(
        onSuccess: (resp) async {
          await localDb.markSynced(localId, resp.id);
          result.onSuccess(resp);
        },
        onError: (error) async {
          if (error is NoInternetException) {
            result.onError(
              NoInternetException(
                'Сохранено локально. Отправим при подключении.',
              ),
            );
          } else {
            result.onError(UnknownApiException('Ошибка: $error'));
          }
        },
      ),
    );
  }

  @override
  Future<void> updateTransaction({
    required TransactionModel model,
    required Result<TransactionResponseModel> result,
  }) async {
    await localDb.upsertTransaction(model, SyncState.update);

    final requestModel = TransactionRequestBody(
      accountId: model.account.id,
      categoryId: model.category.id,
      amount: model.amount,
      transactionDate: model.transactionDate,
      comment: model.comment,
    );

    await transactionApiService.updateTransaction(
      transactionId: model.id,
      requestBody: requestModel,
      result: Result(
        onSuccess: (resp) async {
          await localDb.markSynced(model.id, resp.id);
          result.onSuccess(resp);
        },
        onError: (error) async {
          if (error is NoInternetException) {
            result.onError(NoInternetException('Изменения сохранены офлайн.'));
          } else {
            result.onError(UnknownApiException('Ошибка обновления: $error'));
          }
        },
      ),
    );
  }

  @override
  Future<void> deleteTransaction({
    required TransactionModel transaction,
    required Result<void> result,
  }) async {
    await localDb.upsertTransaction(transaction, SyncState.delete);

    await transactionApiService.deleteTransaction(
      transactionId: transaction.id,
      result: Result(
        onSuccess: (response) async {
          await localDb.deleteCachedTransaction(transaction.id);
          result.onSuccess(response);
        },
        onError: (message) async {
          if (message is NoInternetException) {
            result.onError(
              NoInternetException('Удалим при следующем подключении.'),
            );
          } else {
            result.onError(message);
          }
        },
      ),
    );
  }

  @override
  Future<void> getTransactionById({
    required int transactionId,
    required Result<TransactionModel> result,
  }) async {
    await transactionApiService.getTransactionById(
      transactionId: transactionId,
      result: result,
    );
  }

  @override
  Future<void> syncPending() async {
    final list = await localDb.getPending();
    for (final t in list) {
      await _syncOne<TransactionModel>(
        t.transactionModel.id,
        t.state,
        Result(onSuccess: (_) {}, onError: (_) {}),
      );
    }
  }

  Future<void> _syncOne<T>(
    int localId,
    SyncState state,
    Result<T> original,
  ) async {
    Future<void> handleError(Object error) async {
      if (error is NoInternetException) {
        original.onError(
          NoInternetException('Нет интернета. Попробуем позже.'),
        );
      } else {
        original.onError(UnknownApiException('Ошибка: $error'));
      }
    }

    try {
      switch (state) {
        case SyncState.add:
          final model = await localDb.getCachedTransactionById(localId);
          if (model == null) return;
          await transactionApiService.addTransaction(
            requestBody: model.toRequestBody(),
            result: Result(
              onSuccess: (resp) async {
                await localDb.markSynced(localId, resp.id);
                original.onSuccess(resp as T);
              },
              onError: handleError,
            ),
          );
          break;

        case SyncState.update:
          final model = await localDb.getCachedTransactionById(localId);
          if (model == null) return;
          await transactionApiService.updateTransaction(
            transactionId: model.id,
            requestBody: model.toRequestBody(),
            result: Result(
              onSuccess: (resp) async {
                await localDb.markSynced(localId, resp.id);
                original.onSuccess(resp as T);
              },
              onError: handleError,
            ),
          );
          break;

        case SyncState.delete:
          await transactionApiService.deleteTransaction(
            transactionId: localId,
            result: Result(
              onSuccess: (_) async {
                await localDb.removeLocal(localId);
                original.onSuccess(null as T);
              },
              onError: handleError,
            ),
          );
          break;

        case SyncState.synced:
          break;
      }
    } catch (e) {
      await handleError(e);
    }
  }
}
