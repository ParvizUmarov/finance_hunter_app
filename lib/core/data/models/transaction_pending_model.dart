import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class TransactionPendingModel {
  final SyncState state;
  final TransactionModel transactionModel;

  TransactionPendingModel({
    required this.state,
    required this.transactionModel,
  });

}
