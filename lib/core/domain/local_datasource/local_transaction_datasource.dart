import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/transaction_model.dart';

abstract class LocalTransactionDataSource {
  Future<void> cacheTransactions(List<TransactionModel> transactions);

  Future<TransactionModel> upsertTransaction(TransactionModel model, SyncState state);

  Future<void> markSynced(int localId, int serverId);

  Future<List<TransactionModel>> getCachedTransactions(
    DateTime? startDate,
    DateTime? endDate,
  );

  Future<void> removeLocal(int localId);

  Future<List<TransactionPendingModel>> getPending();

  Future<TransactionModel?> getCachedTransactionById(int id);

  Future<void> deleteCachedTransaction(int id);
}
