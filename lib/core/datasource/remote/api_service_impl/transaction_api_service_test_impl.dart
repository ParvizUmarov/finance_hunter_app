import 'dart:developer';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/request/transaction_period_request_body.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/request/transaction_request_body.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/response/transaction_response_model.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class TransactionApiServiceTestImpl implements TransactionApiService {
  final List<TransactionModel> _fakeDatabase = [
    TransactionModel(
      id: 1,
      account: AccountModel(
        id: 222,
        name: "Счет",
        balance: "12312",
        currency: "RUB",
      ),
      category: CategoryModel(
        id: 12345,
        name: "Category",
        emoji: "qwe",
        isIncome: true,
      ),
      amount: "231123",
      transactionDate: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
  int _idCounter = 1;

  @override
  Future<void> addTransaction({
    required TransactionRequestBody requestBody,
    required Result<TransactionResponseModel> result,
  }) async {
    try {

      final date = requestBody.transactionDate ?? DateTime.now();

      final model = TransactionModel(
        id: _idCounter++,
        account: AccountModel(
          id: requestBody.accountId,
          name: "Счет",
          balance: "12312",
          currency: "RUB",
        ),
        category: CategoryModel(
          id: requestBody.categoryId ?? 0,
          name: "Category",
          emoji: "qwe",
          isIncome: true,
        ),
        amount: "231123",
        comment: requestBody.comment,
        transactionDate: date,
        createdAt: date,
        updatedAt: date,
      );

      _fakeDatabase.add(model);
      result.onSuccess(
        TransactionResponseModel(
          id: model.id,
          accountId: model.account.id,
          categoryId: model.category.id,
          amount: model.amount,
          transactionDate: model.transactionDate,
          comment: model.comment,
          createdAt: model.createdAt,
          updatedAt: model.updatedAt,
        ),
      );
    } catch (e) {
      result.onError(Exception('Failed to add transaction'));
    }
  }

  @override
  Future<void> deleteTransaction({
    required int transactionId,
    required Result<void> result,
  }) async {
    try {
      _fakeDatabase.removeWhere((t) => t.id == transactionId);
      result.onSuccess(null);
    } catch (e) {
      result.onError(Exception('Failed to delete transaction'));
    }
  }

  @override
  Future<void> getTransactionById({
    required int transactionId,
    required Result<TransactionModel> result,
  }) async {
    try {
      final transaction = _fakeDatabase.firstWhere(
        (t) => t.id == transactionId,
      );
      result.onSuccess(transaction);
    } catch (e) {
      result.onError(Exception('Transaction not found'));
    }
  }

  @override
  Future<void> getTransactionByPeriod({
    required int accountId,
    required TransactionPeriodRequestBody requestBody,
    required Result<List<TransactionModel>> result,
  }) async {
    try {
      final filtered = _fakeDatabase.where((t) {
        return t.account.id == accountId &&
            t.transactionDate.isAfter(
              requestBody.startDate ?? DateTime.now(),
            ) &&
            t.transactionDate.isBefore(requestBody.endDate ?? DateTime.now());
      }).toList();
      result.onSuccess(filtered);
    } catch (e) {
      result.onError(Exception('Failed to fetch transactions'));
    }
  }

  @override
  Future<void> updateTransaction({
    required int transactionId,
    required TransactionRequestBody requestBody,
    required Result<TransactionModel> result,
  }) async {
    try {
      final index = _fakeDatabase.indexWhere((t) => t.id == transactionId);
      if (index == -1) throw Exception('Not found');

      final updated = _fakeDatabase[index].copyWith(
        amount: requestBody.amount ?? "0.0",
        comment: requestBody.comment,
      );

      _fakeDatabase[index] = updated;
      result.onSuccess(updated);
    } catch (e) {
      result.onError(Exception('Failed to update transaction'));
    }
  }
}
