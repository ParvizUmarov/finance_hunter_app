import 'package:drift/drift.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class LocalTransactionDatasourceImpl implements LocalTransactionDataSource {
  final AppDatabase db;
  final TransactionModelMapper mapper;

  LocalTransactionDatasourceImpl({required this.db, required this.mapper});

  @override
  Future<void> cacheTransaction(TransactionModel transaction) async {
    await db
        .into(db.transactionTb)
        .insertOnConflictUpdate(mapper.toTableData(transaction));
  }

  @override
  Future<void> cacheTransactions(List<TransactionModel> transactions) async {
    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        db.transactionTb,
        transactions.map((t) => mapper.toTableData(t)).toList(),
      );
    });
  }

  @override
  Future<void> deleteCachedTransaction(int id) async {
    await (db.delete(db.transactionTb)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<TransactionModel?> getCachedTransactionById(int id) async {
    final findTransaction = await (db.select(
      db.transactionTb,
    )..where((t) => t.id.equals(id))).getSingleOrNull();

    return findTransaction != null ? mapper.toModel(findTransaction) : null;
  }

  @override
  Future<List<TransactionModel>> getCachedTransactions(
    DateTime? startDate,
    DateTime? endDate,
  ) async {
    final query = db.select(db.transactionTb);

    if (startDate != null) {
      query.where(
        (tbl) => tbl.transactionDate.isBiggerOrEqualValue(
          startDate.toIso8601String(),
        ),
      );
    }

    if (endDate != null) {
      query.where(
        (tbl) => tbl.transactionDate.isSmallerOrEqualValue(
          endDate.toIso8601String(),
        ),
      );
    }

    final rows = await query.get();
    return rows.map((r) => mapper.toModel(r)).toList();
  }
}
