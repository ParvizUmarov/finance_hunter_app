import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/data/data.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';
import 'package:finance_hunter_app/features/articles/data/data.dart';
import 'package:finance_hunter_app/features/articles/domain/domain.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class AppDependencies {
  late final TransactionRepository transactionRepository;
  late final ArticleRepository articleRepository;
  late final BankAccountRepository bankAccountRepository;

  AppDependencies() {
    transactionRepository = TransactionRepositoryTestImpl();
    articleRepository = ArticleRepositoryTestImpl();
    bankAccountRepository = BankAccountRepositoryTestImpl();
  }
}
