import 'package:finance_hunter_app/features/account/data/models/models.dart';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';

abstract class TransactionRepository {
  Future<TransactionModel> getTransactionById(int transactionId);

  Future<void> getTransactionByPeriod(
    int accountId,
    TransactionPeriodRequestBody requestBody,
    ValueChanged<List<TransactionModel>> onSuccess,
    ValueChanged<String> onError,
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
