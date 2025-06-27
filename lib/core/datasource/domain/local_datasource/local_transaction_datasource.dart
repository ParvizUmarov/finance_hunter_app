import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/transaction_model.dart';

abstract class LocalTransactionDataSource {

  Future<void> cacheTransactions(List<TransactionModel> transactions);
  Future<void> cacheTransaction(TransactionModel transaction);
  Future<List<TransactionModel>> getCachedTransactions();
  Future<TransactionModel?> getCachedTransactionById(int id);
  Future<void> deleteCachedTransaction(int id);

}
