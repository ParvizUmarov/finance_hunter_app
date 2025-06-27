import 'package:drift/drift.dart';

class AccountTb extends Table {
  IntColumn get id => integer()();

  IntColumn get userId => integer()();
  TextColumn get name => text()();
  TextColumn get balance => text()();
  TextColumn get currency => text()();

  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {id};
}