import 'package:drift/drift.dart';
import 'package:finance_hunter_app/core/datasource/local/local_datasource/app_database.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class TransactionModelMapper {
  TransactionTbCompanion toTableData(TransactionModel model) =>
      TransactionTbCompanion(
        id: Value(model.id),
        accountId: Value(model.account.id),
        accountName: Value(model.account.name),
        balance: Value(model.account.balance),
        currency: Value(model.account.currency),
        categoryId: Value(model.category.id),
        categoryName: Value(model.category.name),
        emoji: Value(model.category.emoji),
        isIncome: Value(model.category.isIncome),
        amount: Value(model.amount),
        transactionDate: Value(model.transactionDate.toIso8601String()),
        comment: Value(model.comment),
        createdAt: Value(model.createdAt.toIso8601String()),
        updatedAt: Value(model.updatedAt.toIso8601String()),
      );

  TransactionModel toModel(TransactionTbData r) {
    return TransactionModel(
      id: r.id,
      account: AccountModel(
        id: r.accountId,
        name: r.accountName,
        balance: r.balance,
        currency: r.currency,
      ),
      category: CategoryModel(
        id: r.id,
        name: r.categoryName,
        emoji: r.emoji,
        isIncome: r.isIncome,
      ),
      amount: r.amount,
      transactionDate: DateTime.parse(r.transactionDate),
      createdAt: DateTime.parse(r.createdAt),
      updatedAt: DateTime.parse(r.updatedAt),
    );
  }
}
