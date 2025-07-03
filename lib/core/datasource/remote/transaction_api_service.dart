import 'dart:convert';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class TransactionApiServiceTestImpl extends BaseApiService
    implements TransactionApiService {
  final now = DateTime.now().toUtc().toIso8601String();

  TransactionApiServiceTestImpl(super.dio);

  @override
  Future<void> addTransaction({
    required TransactionRequestBody requestBody,
    required Result<TransactionResponseModel> result,
  }) async {
    await safeRequest(
      request: () async {
        await Future.delayed(Duration(seconds: 2));
        return transactionMockData;
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  @override
  Future<void> getTransactionByPeriod({
    required int accountId,
    required TransactionPeriodRequestBody requestBody,
    required Result<List<TransactionModel>> result,
  }) async {
    await safeRequest<List<TransactionModel>>(
      request: () async {
        await Future.delayed(Duration(seconds: 2));
        final List<dynamic> jsonList = jsonDecode(_mockJson);
        final allTransactions = jsonList
            .map((mock) => TransactionModel.fromJson(mock))
            .toList();

        final start = requestBody.startDate;
        final end = requestBody.endDate;

        final filtered = allTransactions.where((tx) {
          final date = tx.transactionDate;

          if (start != null && end != null) {
            return !date.isBefore(start) && !date.isAfter(end);
          }

          if (start != null) return !date.isBefore(start);
          if (end != null) return !date.isAfter(end);

          return true;
        }).toList();
        return filtered;
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  @override
  Future<void> deleteTransaction({
    required int transactionId,
    required Result<void> result,
  }) async {
    //TODO implement deleteTransaction
  }

  @override
  Future<void> getTransactionById({
    required int transactionId,
    required Result<TransactionModel> result,
  }) async {
    await safeRequest<TransactionModel>(
      request: () async {
        return TransactionModel(
          id: 1,
          account: AccountModel(
            id: 1,
            name: "account",
            balance: "100",
            currency: "RUB",
          ),
          category: CategoryModel(
            id: 1,
            name: "Category",
            emoji: "emoji",
            isIncome: true,
          ),
          amount: "1234",
          transactionDate: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  @override
  Future<void> updateTransaction({
    required int transactionId,
    required TransactionRequestBody requestBody,
    required Result<TransactionResponseModel> result,
  }) async {
    await safeRequest(
      request: () async {
        await Future.delayed(Duration(seconds: 2));
        return transactionMockData;
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  TransactionResponseModel get transactionMockData => TransactionResponseModel(
    id: 1,
    accountId: 1,
    categoryId: 1,
    amount: "123",
    transactionDate: DateTime.now(),
    comment: 'comment',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  String get _mockJson =>
      '''
  [
    {
      "id": 25,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-11T17:55:36Z",
      "comment": "Salary for month",
      "createdAt": "2025-06-11T17:55:37.961224Z",
      "updatedAt": "2025-06-11T17:55:37.961224Z"
    },
    {
      "id": 26,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-11T18:33:08Z",
      "comment": "Salary for month",
      "createdAt": "2025-06-11T18:33:08.977503Z",
      "updatedAt": "2025-06-11T18:33:08.977503Z"
    },
    {
      "id": 27,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-11T18:34:30.713Z",
      "comment": "Salary for month",
      "createdAt": "2025-06-11T18:34:31.751386Z",
      "updatedAt": "2025-06-11T18:34:31.751386Z"
    },
    {
      "id": 28,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.79",
      "transactionDate": "2025-06-11T17:40:40.764Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-11T18:55:21.033038Z",
      "updatedAt": "2025-06-11T18:55:21.033038Z"
    },
    {
      "id": 29,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-11T19:02:17.072Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-11T19:02:21.117051Z",
      "updatedAt": "2025-06-11T19:02:21.117051Z"
    },
    {
      "id": 30,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-11T19:02:17.072Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-11T19:02:33.563568Z",
      "updatedAt": "2025-06-11T19:02:33.563568Z"
    },
    {
      "id": 49,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-15T21:21:30.552Z",
      "comment": null,
      "createdAt": "2025-06-15T21:34:13.646899Z",
      "updatedAt": "2025-06-15T21:34:13.646899Z"
    },
    {
      "id": 32,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-11T23:09:47.986Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-11T23:15:26.530705Z",
      "updatedAt": "2025-06-11T23:15:26.530705Z"
    },
    {
      "id": 37,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-13T11:03:24.132Z",
      "comment": null,
      "createdAt": "2025-06-13T11:04:52.195882Z",
      "updatedAt": "2025-06-13T11:04:52.195882Z"
    },
    {
      "id": 39,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "5000.00",
      "transactionDate": "2025-06-13T13:45:48.282Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-13T13:51:44.302153Z",
      "updatedAt": "2025-06-13T13:51:44.302153Z"
    },
    {
      "id": 40,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "5000.00",
      "transactionDate": "2025-06-13T13:45:48.282Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-13T15:12:23.226263Z",
      "updatedAt": "2025-06-13T15:12:23.226263Z"
    },
    {
      "id": 41,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "5000.00",
      "transactionDate": "2025-06-13T13:45:48.282Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-13T15:13:21.454419Z",
      "updatedAt": "2025-06-13T15:13:21.454419Z"
    },
    {
      "id": 42,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "5000.00",
      "transactionDate": "2025-06-13T13:45:48.282Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-13T15:15:21.868672Z",
      "updatedAt": "2025-06-13T15:15:21.868672Z"
    },
    {
      "id": 1,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "$now",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-04-16T15:36:04.028266Z",
      "updatedAt": "2025-06-14T16:42:22.370342Z"
    },
    {
      "id": 43,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-15T11:55:38.922Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-15T11:56:21.651767Z",
      "updatedAt": "2025-06-15T11:56:21.651767Z"
    },
    {
      "id": 44,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-15T11:55:38.922Z",
      "comment": "Зарплата бобра",
      "createdAt": "2025-06-15T11:56:42.299581Z",
      "updatedAt": "2025-06-15T11:56:42.299581Z"
    },
    {
      "id": 45,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-15T11:55:38.922Z",
      "comment": "",
      "createdAt": "2025-06-15T11:56:53.500333Z",
      "updatedAt": "2025-06-15T11:56:53.500333Z"
    },
    {
      "id": 46,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-15T11:55:38.922Z",
      "comment": null,
      "createdAt": "2025-06-15T11:57:31.635613Z",
      "updatedAt": "2025-06-15T11:57:31.635613Z"
    },
    {
      "id": 47,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "$now",
      "comment": null,
      "createdAt": "2025-06-15T14:17:59.885188Z",
      "updatedAt": "2025-06-15T14:17:59.885188Z"
    },
    {
      "id": 60,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "$now",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-16T20:48:53.521813Z",
      "updatedAt": "2025-06-16T20:48:53.521813Z"
    },
    {
      "id": 62,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 8,
        "name": "Продукты",
        "emoji": "🍎",
        "isIncome": false
      },
      "amount": "100.00",
      "transactionDate": "2025-06-16T21:45:00.929Z",
      "comment": "Молоко",
      "createdAt": "2025-06-16T21:45:18.135638Z",
      "updatedAt": "2025-06-16T21:45:18.135638Z"
    },
    {
      "id": 65,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 9,
        "name": "Транспорт",
        "emoji": "🚗",
        "isIncome": false
      },
      "amount": "120000000.50",
      "transactionDate": "2025-06-16T21:45:00.929Z",
      "comment": "Майбах",
      "createdAt": "2025-06-16T23:49:08.083635Z",
      "updatedAt": "2025-06-16T23:49:08.083635Z"
    },
    {
      "id": 67,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true
      },
      "amount": "500.00",
      "transactionDate": "2025-06-17T08:06:13.857Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-17T08:06:20.457418Z",
      "updatedAt": "2025-06-17T08:06:20.457418Z"
    },
    {
      "id": 68,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": false
      },
      "amount": "500.00",
      "transactionDate": "$now",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-17T08:10:30.406975Z",
      "updatedAt": "2025-06-17T08:10:30.406975Z"
    },
    {
      "id": 69,
      "account": {
        "id": 1,
        "name": "",
        "balance": "-119970099.71",
        "currency": "RUB"
      },
      "category": {
        "id": 8,
        "name": "Продукты",
        "emoji": "🍎",
        "isIncome": false
      },
      "amount": "100.00",
      "transactionDate": "$now",
      "comment": "Молоко",
      "createdAt": "2025-06-16T21:45:18.135638Z",
      "updatedAt": "2025-06-16T21:45:18.135638Z"
    }
  ]
  ''';
}
