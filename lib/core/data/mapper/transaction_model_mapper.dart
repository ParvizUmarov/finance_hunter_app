import 'package:drift/drift.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/core/datasource/local/local_datasource/app_database.dart';
import 'package:finance_hunter_app/features/analysis/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class TransactionModelMapper {
  TransactionTbCompanion toTableData(TransactionModel model, SyncState state) =>
      TransactionTbCompanion(
        id: Value(model.id),
        serverId: Value(model.id),
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
        syncState: Value(SyncState.values[state.index].index),
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

  PendingTransactionTbCompanion toPendingTableData(
    TransactionRequestBody model,
    int? transactionId,
    PendingOperationType type,
  ) => PendingTransactionTbCompanion(
    id: Value(transactionId ?? 0),
    accountId: Value(model.accountId),
    categoryId: Value(model.categoryId ?? 0),
    amount: Value(model.amount ?? ""),
    transactionDate: Value(model.transactionDate?.toIso8601String() ?? ""),
    comment: Value(model.comment),
    operationType: Value(PendingOperationType.values[type.index].index),
  );

  TransactionModel fromPendingToModel(PendingTransactionTbData r) {
    return TransactionModel(
      id: r.id,
      account: AccountModel(
        id: r.accountId,
        name: '',
        balance: "",
        currency: "",
      ),
      category: CategoryModel(id: r.id, name: '', emoji: '', isIncome: false),
      amount: r.amount,
      transactionDate: DateTime.parse(r.transactionDate),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  TransactionTbCompanion fromRequestModelToTableData(
    TransactionRequestBody model, [
    PendingOperationType? type,
  ]) => TransactionTbCompanion(
    id: Value(0),
    accountId: Value(model.accountId),
    accountName: Value(""),
    balance: Value(""),
    currency: Value(""),
    categoryId: Value(model.categoryId ?? 0),
    categoryName: Value(''),
    emoji: Value(''),
    isIncome: Value(false),
    amount: Value(''),
    transactionDate: Value(model.transactionDate?.toIso8601String() ?? ''),
    comment: Value(model.comment),
    createdAt: Value(''),
    updatedAt: Value(''),
  );
}
