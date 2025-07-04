import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/request/transaction_request_body.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/transaction_model.dart';

class LocalPendingTransactionDatasourceImpl
    implements LocalPendingTransactionDatasource {
  final AppDatabase db;
  final TransactionModelMapper mapper;

  LocalPendingTransactionDatasourceImpl({
    required this.db,
    required this.mapper,
  });

  @override
  Future<void> deletePendingTransaction(int id) async {
    await (db.delete(
      db.pendingTransactionTb,
    )..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<List<TransactionModel>> getAllPendingTransactions() async {
    final query = await db.select(db.pendingTransactionTb).get();
    return query.map((r) => mapper.fromPendingToModel(r)).toList();
  }

  @override
  Future<void> insertPendingTransaction(
    TransactionRequestBody transaction,
    int? transactionId,
    PendingOperationType type,
  ) async {
    await db
        .into(db.pendingTransactionTb)
        .insertOnConflictUpdate(
          mapper.toPendingTableData(transaction, transactionId, type),
        );
  }
}
