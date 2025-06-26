import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:finance_hunter_app/core/core.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionApiService transactionApiService;

  TransactionRepositoryImpl({required this.transactionApiService});

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
        onSuccess: (response) {
          result.onSuccess(response);
        },
        onError: (message) {
          result.onError(message);
        },
      ),
    );
  }

  @override
  Future<void> addTransaction({
    required TransactionRequestBody requestBody,
    required Result<TransactionResponseModel> result,
  }) async {
    await transactionApiService.addTransaction(
      requestBody: requestBody,
      result: result,
    );
  }

  @override
  Future<void> deleteTransaction({
    required int transactionId,
    required Result<void> result,
  }) async {
    await transactionApiService.deleteTransaction(
      transactionId: transactionId,
      result: result,
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
  Future<void> updateTransaction({
    required int transactionId,
    required TransactionRequestBody requestBody,
    required Result<TransactionResponseModel> result,
  }) async {
    await transactionApiService.updateTransaction(
      transactionId: transactionId,
      requestBody: requestBody,
      result: result,
    );
  }
}
