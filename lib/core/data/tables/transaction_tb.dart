import 'package:drift/drift.dart';

class TransactionTb extends Table {
  IntColumn get id => integer().nullable()();

  IntColumn get localId => integer().autoIncrement()();
  IntColumn get accountId => integer()();
  TextColumn get accountName => text()();
  TextColumn get balance => text()();
  TextColumn get currency => text()();
  IntColumn get categoryId => integer()();
  TextColumn get categoryName => text()();
  TextColumn get emoji => text()();
  BoolColumn get isIncome => boolean()();
  TextColumn get amount => text()();
  TextColumn get transactionDate => text()();
  TextColumn get comment => text().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  IntColumn get syncState => integer()();
}
