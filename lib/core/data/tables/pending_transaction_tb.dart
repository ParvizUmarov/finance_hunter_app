import 'package:drift/drift.dart';

class PendingTransactionTb extends Table {
  IntColumn get id => integer()();

  IntColumn get accountId => integer()();

  IntColumn get categoryId => integer()();

  TextColumn get amount => text()();
  TextColumn get transactionDate => text()();
  TextColumn get comment => text().nullable()();

  IntColumn get operationType => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
