import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:finance_hunter_app/core/core.dart';

class TransactionRepositoryTestImpl implements TransactionRepository {
  final TransactionApiService transactionApiService;

  TransactionRepositoryTestImpl({required this.transactionApiService});

  @override
  Future<TransactionResponseModel> addTransaction(
    TransactionRequestBody requestBody,
  ) async {
    return TransactionResponseModel(
      id: 1,
      accountId: 1,
      categoryId: 1,
      amount: "123",
      transactionDate: DateTime.now(),
      comment: 'comment',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<void> deleteTransaction(int transactionId) async {}

  @override
  Future<TransactionModel> getTransactionById(int transactionId) async =>
      _getMockTransactionModel();

  @override
  Future<void> getTransactionByPeriod(
    int accountId,
    TransactionPeriodRequestBody requestBody,
    ValueChanged<List<TransactionModel>> onSuccess,
    ValueChanged<String> onError,
  ) async {
    await transactionApiService.getTransactionByPeriod(
      accountId: accountId,
      requestBody: requestBody,
      onSuccess: (response) {
        onSuccess(response);
      },
      onError: (message) => onError(message),
    );
  }

  @override
  Future<TransactionModel> updateTransaction(
    int transactionId,
    TransactionRequestBody requestBody,
  ) async => _getMockTransactionModel();

  TransactionModel _getMockTransactionModel() {
    return TransactionModel(
      id: 1,
      amount: "123",
      transactionDate: DateTime.now(),
      comment: 'comment',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      account: AccountModel(
        id: 1,
        name: 'name',
        balance: 'balance',
        currency: 'currency',
      ),
      category: CategoryModel(
        id: 0,
        name: "Зарплата",
        emoji: "💰",
        isIncome: true,
      ),
    );
  }
}
