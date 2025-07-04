import 'package:drift/drift.dart';

class CategoryTb extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get emoji => text()();
  BoolColumn get isIncome => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}