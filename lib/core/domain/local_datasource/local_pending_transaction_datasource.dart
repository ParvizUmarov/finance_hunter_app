import 'package:finance_hunter_app/core/data/models/pending_operation_type.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/request/transaction_request_body.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/transaction_model.dart';

abstract interface class LocalPendingTransactionDatasource {
  Future<void> insertPendingTransaction(
    TransactionRequestBody transaction,
    int transactionId,
    PendingOperationType type,
  );

  Future<List<TransactionModel>> getAllPendingTransactions();

  Future<void> deletePendingTransaction(int id);
}
