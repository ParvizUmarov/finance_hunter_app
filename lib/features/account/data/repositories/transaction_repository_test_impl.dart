import 'package:finance_hunter_app/features/account/data/models/request/transaction_request_body.dart';
import 'package:finance_hunter_app/features/account/data/models/response/transaction_response_model.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';

class TransactionRepositoryTestImpl implements TransactionRepository {

  @override
  Future<TransactionResponseModel> addTransaction(
    TransactionRequestBody requestBody,
  ) async {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTransaction(int transactionId) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<TransactionModel> getTransactionById(int transactionId) {
    // TODO: implement getTransactionById
    throw UnimplementedError();
  }

  @override
  Future<TransactionModel> updateTransaction(
    int transactionId,
    TransactionRequestBody requestBody,
  ) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
