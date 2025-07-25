import 'package:drift/drift.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/transaction_model.dart';

class TransactionLocalDatasourceTestImpl implements LocalTransactionDataSource {
  final TransactionModelMapper mapper;

  TransactionLocalDatasourceTestImpl({required this.mapper});

  final List<TransactionTbCompanion> _storage = [];
  int _localIdCounter = 1;

  @override
  Future<TransactionModel> upsertTransaction(
    TransactionModel model,
    SyncState state,
  ) async {
    var companion = mapper.toTableData(model, state);

    final int localId = companion.localId.present
        ? companion.localId.value!
        : 0;

    if (localId != 0) {
      final index = _storage.indexWhere(
        (e) => e.localId.present && e.localId.value == localId,
      );
      if (index != -1) {
        _storage[index] = companion;
      } else {
        _storage.add(companion);
      }
    } else {
      companion = companion.copyWith(localId: Value(_localIdCounter++));
      _storage.add(companion);
    }

    return mapper.toModel(_companionToData(_storage.last));
  }

  @override
  Future<void> cacheTransactions(List<TransactionModel> transactions) async {
    for (var t in transactions) {
      await upsertTransaction(t, SyncState.synced);
    }
  }

  @override
  Future<void> deleteCachedTransaction(int id) async {
    _storage.removeWhere((t) => t.id.present && t.id.value == id);
  }

  @override
  Future<TransactionModel?> getCachedTransactionById(int id) async {
    try {
      final TransactionTbCompanion found = _storage.firstWhere(
        (t) => t.localId.present && t.localId.value == id,
      );
      return mapper.toModel(_companionToData(found));
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TransactionModel>> getCachedTransactions(
    DateTime? startDate,
    DateTime? endDate,
  ) async {
    return _storage
        .where((t) {
          final data = _companionToData(t);
          final date = DateTime.parse(data.transactionDate);
          final notDeleted = data.syncState != SyncState.delete;
          final afterStart =
              startDate == null ||
              date.isAfter(startDate) ||
              date.isAtSameMomentAs(startDate);
          final beforeEnd =
              endDate == null ||
              date.isBefore(endDate) ||
              date.isAtSameMomentAs(endDate);
          return notDeleted && afterStart && beforeEnd;
        })
        .map((t) => mapper.toModel(_companionToData(t)))
        .toList();
  }

  @override
  Future<List<TransactionPendingModel>> getPending() async {
    return _storage
        .where((t) {
          final syncState = t.syncState.value;
          return syncState != SyncState.synced.index;
        })
        .map((t) {
          final data = _companionToData(t);
          return TransactionPendingModel(
            state: SyncState.values[data.syncState],
            transactionModel: mapper.toModel(data),
          );
        })
        .toList();
  }

  @override
  Future<void> markSynced(int localId, int serverId) async {
    final index = _storage.indexWhere(
      (t) => t.localId.present && t.localId.value == localId,
    );
    if (index != -1) {
      final updated = _storage[index].copyWith(
        id: Value(serverId),
        syncState: Value(SyncState.synced.index),
      );
      _storage[index] = updated;
    }
  }

  @override
  Future<void> removeLocal(int localId) async {
    _storage.removeWhere(
      (t) => t.localId.present && t.localId.value == localId,
    );
  }

  TransactionTbData _companionToData(TransactionTbCompanion companion) {
    return TransactionTbData(
      id: companion.id.present ? companion.id.value : null,
      localId: companion.localId.present ? companion.localId.value : 0,
      accountId: companion.accountId.present ? companion.accountId.value : 0,
      accountName: companion.accountName.present
          ? companion.accountName.value
          : '',
      balance: companion.balance.present ? companion.balance.value : '',
      currency: companion.currency.present ? companion.currency.value : '',
      categoryId: companion.categoryId.present ? companion.categoryId.value : 0,
      categoryName: companion.categoryName.present
          ? companion.categoryName.value
          : '',
      emoji: companion.emoji.present ? companion.emoji.value : '',
      isIncome: companion.isIncome.present ? companion.isIncome.value : false,
      amount: companion.amount.present ? companion.amount.value : '',
      transactionDate: companion.transactionDate.present
          ? companion.transactionDate.value
          : '',
      comment: companion.comment.present ? companion.comment.value : '',
      createdAt: companion.createdAt.present ? companion.createdAt.value : '',
      updatedAt: companion.updatedAt.present ? companion.updatedAt.value : '',
      syncState: companion.syncState.present ? companion.syncState.value : 0,
    );
  }
}
