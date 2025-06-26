import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/data/data.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';
import 'package:finance_hunter_app/features/articles/data/data.dart';
import 'package:finance_hunter_app/features/articles/domain/domain.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class AppDependencies {
  late Dio dio;
  late final TransactionRepository transactionRepository;
  late final ArticleRepository articleRepository;
  late final BankAccountRepository bankAccountRepository;
  late final Connectivity connectivity;

  AppDependencies() {
    dio = Dio();
    transactionRepository = TransactionRepositoryImpl(
      transactionApiService: TransactionApiServiceTestImpl(
        dio
      ),
    );
    articleRepository = ArticleRepositoryTestImpl();
    bankAccountRepository = BankAccountRepositoryTestImpl();
    connectivity = Connectivity();
  }
}
