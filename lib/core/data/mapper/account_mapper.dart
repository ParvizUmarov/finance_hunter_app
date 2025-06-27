import 'package:drift/drift.dart';
import 'package:finance_hunter_app/core/datasource/local/local_datasource/app_database.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';

class AccountMapper {
  AccountTbCompanion toTableData(BankAccountModel model) => AccountTbCompanion(
    id: Value(model.id),
    userId: Value(model.userId),
    name: Value(model.name),
    balance: Value(model.balance),
    currency: Value(model.currency),
    createdAt: Value(model.createdAt.toIso8601String()),
    updatedAt: Value(model.updatedAt.toIso8601String()),
  );

  BankAccountModel toModel(AccountTbData r) {
    return BankAccountModel(
      id: r.id,
      createdAt: DateTime.parse(r.createdAt),
      updatedAt: DateTime.parse(r.updatedAt),
      userId: r.id,
      name: r.name,
      balance: r.balance,
      currency: r.currency,
    );
  }
}
