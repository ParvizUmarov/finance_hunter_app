import 'package:finance_hunter_app/features/articles/data/data.dart';
import 'package:finance_hunter_app/features/articles/domain/domain.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class AppDependencies {
  late final TransactionRepository transactionRepository;
  late final ArticleRepository articleRepository;

  AppDependencies() {
    transactionRepository = TransactionRepositoryTestImpl();
    articleRepository = ArticleRepositoryTestImpl();
  }
}
