import 'package:finance_hunter_app/features/account/data/models/models.dart';
import '../../data/data.dart';
import '../models/models.dart';

abstract class TransactionRepository {
  Future<TransactionModel> getTransactionById(int transactionId);

  Future<List<TransactionModel>> getTransactionByPeriod(
    int accountId,
    TransactionPeriodRequestBody requestBody,
  );

  Future<TransactionResponseModel> addTransaction(
    TransactionRequestBody requestBody,
  );

  Future<TransactionModel> updateTransaction(
    int transactionId,
    TransactionRequestBody requestBody,
  );

  Future<void> deleteTransaction(int transactionId);
}
