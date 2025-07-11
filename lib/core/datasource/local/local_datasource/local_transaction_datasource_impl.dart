import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class LocalTransactionDatasourceImpl implements LocalTransactionDataSource {
  final AppDatabase db;
  final TransactionModelMapper mapper;

  LocalTransactionDatasourceImpl({required this.db, required this.mapper});

  @override
  Future<TransactionModel> upsertTransaction(
    TransactionModel model,
    SyncState state,
  ) async {
    final tableCompanion = mapper.toTableData(model, state);

    final insertedId = await db
        .into(db.transactionTb)
        .insertOnConflictUpdate(tableCompanion);

    final inserted = await (db.select(db.transactionTb)
      ..where((tbl) => tbl.localId.equals(insertedId)))
        .getSingle();

    final transactions = await (db.select(db.transactionTb)).get();
    return mapper.toModel(inserted);
  }

  @override
  Future<void> cacheTransactions(List<TransactionModel> transactions) async {
    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        db.transactionTb,
        transactions
            .map((t) => mapper.toTableData(t, SyncState.synced))
            .toList(),
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
    )..where((t) => t.localId.equals(id))).getSingleOrNull();

    return findTransaction != null ? mapper.toModel(findTransaction) : null;
  }

  @override
  Future<List<TransactionModel>> getCachedTransactions(
    DateTime? startDate,
    DateTime? endDate,
  ) async {
    final query = db.select(db.transactionTb)
      ..where((t) => t.syncState.isNotIn([SyncState.delete.index]));

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

  @override
  Future<List<TransactionPendingModel>> getPending() async {
    final rows = await (db.select(
      db.transactionTb,
    )..where((t) => t.syncState.isBiggerThanValue(0))).get();
    return rows
        .map(
          (t) => TransactionPendingModel(
            state: SyncState.values[t.syncState],
            transactionModel: mapper.toModel(t),
          ),
        )
        .toList();
  }

  @override
  Future<void> markSynced(int localId, int serverId) async {
    await (db.update(
      db.transactionTb,
    )..where((t) => t.localId.equals(localId))).write(
      TransactionTbCompanion(
        id: Value(serverId),
        syncState: Value(SyncState.synced.index),
      ),
    );
  }

  @override
  Future<void> removeLocal(int localId) async {
    await (db.delete(
      db.transactionTb,
    )..where((t) => t.localId.equals(localId))).go();
  }
}
