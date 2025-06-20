import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class AppDependencies {
  late final TransactionRepository transactionRepository;

  AppDependencies() {
    transactionRepository = TransactionRepositoryTestImpl();
  }
}
