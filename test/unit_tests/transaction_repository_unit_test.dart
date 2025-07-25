import 'dart:developer';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/models.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/repositories/transaction_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TransactionRepository repository;
  late TransactionApiService mockApi;
  late LocalTransactionDataSource mockDb;

  setUp(() {
    mockApi = TransactionApiServiceTestImpl();
    mockDb = TransactionLocalDatasourceTestImpl(
      mapper: TransactionModelMapper(),
    );
    repository = TransactionRepositoryImpl(
      transactionApiService: mockApi,
      localDb: mockDb,
    );
  });

  group('addTransaction', () {
    test('add transaction success result', () async {
      final createdTime = DateTime.now();

      final requestModel = TransactionModel(
        id: 0,
        account: AccountModel(
          id: 23,
          name: "Account name",
          balance: "123.00",
          currency: "RUB",
        ),
        category: CategoryModel(
          id: 44,
          name: "Category name",
          emoji: "emoji",
          isIncome: true,
        ),
        amount: '323.00',
        transactionDate: createdTime,
        createdAt: createdTime,
        updatedAt: createdTime,
      );

      final expectedResult = createdTime;

      await repository.addTransaction(
        model: requestModel,
        result: Result(
          onSuccess: (response) {
            expect(response.transactionDate, expectedResult);
          },
          onError: (message) {
            expect(null, expectedResult);
          },
        ),
      );
    });
  });

  group('getTransactionById', () {
    test('The API call goes through without errors', () async {
      final expectedId = 1;

      await repository.getTransactionById(
        transactionId: expectedId,
        result: Result(
          onSuccess: (response) {
              expect(response.id, expectedId);
          },
          onError: (error) {
            expect(-1, expectedId);
          },
        ),
      );
    });
  });
}
