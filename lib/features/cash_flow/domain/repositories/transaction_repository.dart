import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';

abstract class TransactionRepository {

  Future<void> getTransactionById({
    required int transactionId,
    required Result<TransactionModel> result,
  });

  Future<void> getTransactionByPeriod({
    required int accountId,
    required TransactionPeriodRequestBody requestBody,
    required Result<List<TransactionModel>> result,
  });

  Future<void> addTransaction({
    required TransactionRequestBody requestBody,
    required Result<TransactionResponseModel> result,
  });

  Future<void> updateTransaction({
    required int transactionId,
    required TransactionRequestBody requestBody,
    required Result<TransactionResponseModel> result,
  });

  Future<void> deleteTransaction({
    required int transactionId,
    required Result<void> result,
  });
}
