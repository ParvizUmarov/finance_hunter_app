import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/models.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/repositories/transaction_repository.dart';

class MockTransactionApiService extends Mock implements TransactionApiService {}

class MockLocalTransactionDataSource extends Mock
    implements LocalTransactionDataSource {}

class FakeTransactionRequestBody extends Fake
    implements TransactionRequestBody {}

class FakeResultTransactionResponse extends Fake
    implements Result<TransactionResponseModel> {}

class FakeResultTransactionModel extends Fake
    implements Result<TransactionModel> {}

class FakeResultPeriodRequestBody extends Fake
    implements Result<TransactionPeriodRequestBody> {}

class FakeTransactionPeriodRequestBody extends Fake
    implements TransactionPeriodRequestBody {}

class FakeResultListTransactionModel extends Fake
    implements Result<List<TransactionModel>> {}

class FakeResultListPendingTransactionModel extends Fake
    implements Result<List<TransactionPendingModel>> {}

void main() {
  late TransactionRepository repository;
  late MockTransactionApiService mockApi;
  late MockLocalTransactionDataSource mockDb;

  setUpAll(() {
    registerFallbackValue(FakeTransactionRequestBody());
    registerFallbackValue(FakeResultTransactionResponse());
    registerFallbackValue(FakeResultTransactionModel());
    registerFallbackValue(FakeResultPeriodRequestBody());
    registerFallbackValue(FakeTransactionPeriodRequestBody());
    registerFallbackValue(FakeResultListTransactionModel());
    registerFallbackValue(FakeResultListPendingTransactionModel());
    registerFallbackValue(SyncState.synced);
    registerFallbackValue(
      TransactionModel(
        id: 0,
        account: AccountModel(id: 0, name: '', balance: '', currency: ''),
        category: CategoryModel(id: 0, name: '', emoji: '', isIncome: true),
        amount: '',
        transactionDate: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  });

  setUp(() {
    mockApi = MockTransactionApiService();
    mockDb = MockLocalTransactionDataSource();
    repository = TransactionRepositoryImpl(
      transactionApiService: mockApi,
      localDb: mockDb,
    );

    when(() => mockDb.getPending()).thenAnswer((_) async => <TransactionPendingModel>[]);
  });

  group('addTransaction', () {
    test('calls onSuccess when API succeeds', () async {
      final createdTime = DateTime.now();
      final requestModel = TransactionModel(
        id: 0,
        account: AccountModel(
          id: 23,
          name: "Account",
          balance: "123",
          currency: "RUB",
        ),
        category: CategoryModel(
          id: 44,
          name: "Category",
          emoji: "emoji",
          isIncome: true,
        ),
        amount: '323.00',
        transactionDate: createdTime,
        createdAt: createdTime,
        updatedAt: createdTime,
      );

      when(
        () => mockDb.upsertTransaction(any(), any()),
      ).thenAnswer((_) async => requestModel);
      when(
        () => mockApi.addTransaction(
          requestBody: any(named: 'requestBody'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result =
            invocation.namedArguments[#result]
                as Result<TransactionResponseModel>;
        result.onSuccess(
          TransactionResponseModel(
            id: 1,
            accountId: 33,
            categoryId: 55,
            amount: "213",
            transactionDate: createdTime,
            comment: "Some comment",
            createdAt: createdTime,
            updatedAt: createdTime,
          ),
        );
      });
      when(() => mockDb.markSynced(any(), any())).thenAnswer((_) async {});

      await repository.addTransaction(
        model: requestModel,
        result: Result(
          onSuccess: (response) {
            expect(response.id, 1);
            expect(response.transactionDate, createdTime);
          },
          onError: (_) => fail('Expected success'),
        ),
      );
    });

    test('calls onSuccess with local model when NoInternetException', () async {
      final createdTime = DateTime.now();
      final requestModel = TransactionModel(
        id: 0,
        account: AccountModel(
          id: 23,
          name: "Account",
          balance: "123",
          currency: "RUB",
        ),
        category: CategoryModel(
          id: 44,
          name: "Category",
          emoji: "emoji",
          isIncome: true,
        ),
        amount: '323.00',
        transactionDate: createdTime,
        createdAt: createdTime,
        updatedAt: createdTime,
      );

      when(
        () => mockDb.upsertTransaction(any(), any()),
      ).thenAnswer((_) async => requestModel);
      when(
        () => mockApi.addTransaction(
          requestBody: any(named: 'requestBody'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result =
            invocation.namedArguments[#result]
                as Result<TransactionResponseModel>;
        result.onError(NoInternetException('No internet'));
      });

      await repository.addTransaction(
        model: requestModel,
        result: Result(
          onSuccess: (response) {
            expect(response.id, requestModel.id);
          },
          onError: (_) => fail('Expected success fallback'),
        ),
      );
    });

    test('calls onError on API error other than NoInternetException', () async {
      final createdTime = DateTime.now();
      final requestModel = TransactionModel(
        id: 0,
        account: AccountModel(
          id: 23,
          name: "Account",
          balance: "123",
          currency: "RUB",
        ),
        category: CategoryModel(
          id: 44,
          name: "Category",
          emoji: "emoji",
          isIncome: true,
        ),
        amount: '323.00',
        transactionDate: createdTime,
        createdAt: createdTime,
        updatedAt: createdTime,
      );

      when(
        () => mockDb.upsertTransaction(any(), any()),
      ).thenAnswer((_) async => requestModel);
      when(
        () => mockApi.addTransaction(
          requestBody: any(named: 'requestBody'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result =
            invocation.namedArguments[#result]
                as Result<TransactionResponseModel>;
        result.onError(UnknownApiException());
      });

      await repository.addTransaction(
        model: requestModel,
        result: Result(
          onSuccess: (_) => fail('Expected error'),
          onError: (message) {
            expect(message, isA<UnknownApiException>());
          },
        ),
      );
    });
  });

  group('updateTransaction', () {
    test('calls onSuccess when API succeeds', () async {
      final createdTime = DateTime.now();
      final model = TransactionModel(
        id: 42,
        account: AccountModel(
          id: 1,
          name: "Account",
          balance: "200",
          currency: "USD",
        ),
        category: CategoryModel(
          id: 2,
          name: "Cat",
          emoji: "😀",
          isIncome: false,
        ),
        amount: '100',
        transactionDate: createdTime,
        createdAt: createdTime,
        updatedAt: createdTime,
      );

      when(
        () => mockDb.upsertTransaction(any(), any()),
      ).thenAnswer((_) async => model);
      when(
        () => mockApi.updateTransaction(
          transactionId: any(named: 'transactionId'),
          requestBody: any(named: 'requestBody'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result =
            invocation.namedArguments[#result] as Result<TransactionModel>;
        result.onSuccess(model);
      });
      when(() => mockDb.markSynced(any(), any())).thenAnswer((_) async {});

      await repository.updateTransaction(
        model: model,
        result: Result(
          onSuccess: (resp) {
            expect(resp.id, model.id);
          },
          onError: (_) => fail('Expected success'),
        ),
      );
    });

    test('calls onSuccess with local model on NoInternetException', () async {
      final createdTime = DateTime.now();
      final model = TransactionModel(
        id: 42,
        account: AccountModel(
          id: 1,
          name: "Account",
          balance: "200",
          currency: "USD",
        ),
        category: CategoryModel(
          id: 2,
          name: "Cat",
          emoji: "😀",
          isIncome: false,
        ),
        amount: '100',
        transactionDate: createdTime,
        createdAt: createdTime,
        updatedAt: createdTime,
      );

      when(
        () => mockDb.upsertTransaction(any(), any()),
      ).thenAnswer((_) async => model);
      when(
        () => mockApi.updateTransaction(
          transactionId: any(named: 'transactionId'),
          requestBody: any(named: 'requestBody'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result =
            invocation.namedArguments[#result] as Result<TransactionModel>;
        result.onError(NoInternetException('No internet'));
      });

      await repository.updateTransaction(
        model: model,
        result: Result(
          onSuccess: (resp) {
            expect(resp.id, model.id);
          },
          onError: (_) => fail('Expected success fallback'),
        ),
      );
    });

    test('calls onError on other API errors', () async {
      final createdTime = DateTime.now();
      final model = TransactionModel(
        id: 42,
        account: AccountModel(
          id: 1,
          name: "Account",
          balance: "200",
          currency: "USD",
        ),
        category: CategoryModel(
          id: 2,
          name: "Cat",
          emoji: "😀",
          isIncome: false,
        ),
        amount: '100',
        transactionDate: createdTime,
        createdAt: createdTime,
        updatedAt: createdTime,
      );

      when(
        () => mockDb.upsertTransaction(any(), any()),
      ).thenAnswer((_) async => model);
      when(
        () => mockApi.updateTransaction(
          transactionId: any(named: 'transactionId'),
          requestBody: any(named: 'requestBody'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result =
            invocation.namedArguments[#result] as Result<TransactionModel>;
        result.onError(UnknownApiException());
      });

      await repository.updateTransaction(
        model: model,
        result: Result(
          onSuccess: (_) => fail('Expected error'),
          onError: (error) {
            expect(error, isA<UnknownApiException>());
          },
        ),
      );
    });
  });

  group('deleteTransaction', () {
    test('calls onSuccess when API succeeds', () async {
      final model = TransactionModel(
        id: 42,
        account: AccountModel(
          id: 1,
          name: "Account",
          balance: "200",
          currency: "USD",
        ),
        category: CategoryModel(
          id: 2,
          name: "Cat",
          emoji: "😀",
          isIncome: false,
        ),
        amount: '100',
        transactionDate: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      when(
        () => mockDb.upsertTransaction(any(), any()),
      ).thenAnswer((_) async => model);
      when(
        () => mockApi.deleteTransaction(
          transactionId: any(named: 'transactionId'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result = invocation.namedArguments[#result] as Result<void>;
        result.onSuccess(null);
      });
      when(
        () => mockDb.deleteCachedTransaction(any()),
      ).thenAnswer((_) async {});

      await repository.deleteTransaction(
        transaction: model,
        result: Result(
          onSuccess: (resp) {
            expect(true, isTrue);
          },
          onError: (_) => fail('Expected success'),
        ),
      );
    });

    test('calls onSuccess with empty when NoInternetException', () async {
      final model = TransactionModel(
        id: 42,
        account: AccountModel(
          id: 1,
          name: "Account",
          balance: "200",
          currency: "USD",
        ),
        category: CategoryModel(
          id: 2,
          name: "Cat",
          emoji: "😀",
          isIncome: false,
        ),
        amount: '100',
        transactionDate: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      when(
        () => mockDb.upsertTransaction(any(), any()),
      ).thenAnswer((_) async => model);
      when(
        () => mockApi.deleteTransaction(
          transactionId: any(named: 'transactionId'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result = invocation.namedArguments[#result] as Result<void>;
        result.onError(NoInternetException('No internet'));
      });

      await repository.deleteTransaction(
        transaction: model,
        result: Result(
          onSuccess: (resp) {
            expect(true, isTrue);
          },
          onError: (_) => fail('Expected success fallback'),
        ),
      );
    });

    test('calls onError on API error other than NoInternetException', () async {
      final model = TransactionModel(
        id: 42,
        account: AccountModel(
          id: 1,
          name: "Account",
          balance: "200",
          currency: "USD",
        ),
        category: CategoryModel(
          id: 2,
          name: "Cat",
          emoji: "😀",
          isIncome: false,
        ),
        amount: '100',
        transactionDate: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      when(
        () => mockDb.upsertTransaction(any(), any()),
      ).thenAnswer((_) async => model);
      when(
        () => mockApi.deleteTransaction(
          transactionId: any(named: 'transactionId'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result = invocation.namedArguments[#result] as Result<void>;
        result.onError(UnknownApiException());
      });

      await repository.deleteTransaction(
        transaction: model,
        result: Result(
          onSuccess: (_) => fail('Expected error'),
          onError: (message) {
            expect(message, isA<UnknownApiException>());
          },
        ),
      );
    });
  });

  group('getTransactionByPeriod', () {
    test('calls onSuccess with cached transactions on API success', () async {
      final createdTime = DateTime.now();

      final requestBody = TransactionPeriodRequestBody(
        startDate: createdTime.subtract(Duration(days: 1)),
        endDate: createdTime,
        accountId: 1,
      );

      final cachedTransactions = <TransactionModel>[
        TransactionModel(
          id: 1,
          account: AccountModel(
            id: 1,
            name: "A",
            balance: "100",
            currency: "USD",
          ),
          category: CategoryModel(
            id: 2,
            name: "Cat",
            emoji: "😀",
            isIncome: true,
          ),
          amount: '50',
          transactionDate: createdTime,
          createdAt: createdTime,
          updatedAt: createdTime,
        ),
      ];

      when(() => mockDb.cacheTransactions(any())).thenAnswer((_) async {});
      when(
        () => mockDb.getCachedTransactions(any(), any()),
      ).thenAnswer((_) async => cachedTransactions);
      when(
        () => mockApi.getTransactionByPeriod(
          accountId: any(named: 'accountId'),
          requestBody: any(named: 'requestBody'),
          result: any(named: 'result'),
        ),
      ).thenAnswer((invocation) async {
        final result =
            invocation.namedArguments[#result]
                as Result<List<TransactionModel>>;
        result.onSuccess([]);
      });

      await repository.getTransactionByPeriod(
        accountId: 1,
        requestBody: requestBody,
        result: Result(
          onSuccess: (response) {
            expect(response, cachedTransactions);
          },
          onError: (_) => fail('Expected success'),
        ),
      );
    });

    test(
      'calls onSuccess with cached transactions on API error without internet',
      () async {
        final createdTime = DateTime.now();

        final requestBody = TransactionPeriodRequestBody(
          startDate: createdTime.subtract(Duration(days: 1)),
          endDate: createdTime,
          accountId: 1,
        );

        final cachedTransactions = <TransactionModel>[
          TransactionModel(
            id: 1,
            account: AccountModel(
              id: 1,
              name: "A",
              balance: "100",
              currency: "USD",
            ),
            category: CategoryModel(
              id: 2,
              name: "Cat",
              emoji: "😀",
              isIncome: true,
            ),
            amount: '50',
            transactionDate: createdTime,
            createdAt: createdTime,
            updatedAt: createdTime,
          ),
        ];

        when(
          () => mockDb.getCachedTransactions(any(), any()),
        ).thenAnswer((_) async => cachedTransactions);
        when(
          () => mockApi.getTransactionByPeriod(
            accountId: any(named: 'accountId'),
            requestBody: any(named: 'requestBody'),
            result: any(named: 'result'),
          ),
        ).thenAnswer((invocation) async {
          final result =
              invocation.namedArguments[#result]
                  as Result<List<TransactionModel>>;
          result.onError(NoInternetException('No internet'));
        });

        await repository.getTransactionByPeriod(
          accountId: 1,
          requestBody: requestBody,
          result: Result(
            onSuccess: (response) {
              expect(response, cachedTransactions);
            },
            onError: (_) => fail('Expected success fallback'),
          ),
        );
      },
    );
  });
}
