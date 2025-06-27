import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/core/datasource/local/local_datasource/local_account_datasource_impl.dart';
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

  late final LocalAccountDataSource localAccountDataSource;
  late final LocalTransactionDataSource localTransactionDataSource;
  late final AppDatabase appDatabase;

  late final AccountMapper accountMapper;
  late final TransactionModelMapper transactionModelMapper;

  late final TransactionApiService transactionApiService;
  late final AccountApiService accountApiService;

  AppDependencies(IDataBase iDataBase) {
    dio = Dio();
    appDatabase = AppDatabase();
    connectivity = Connectivity();
    transactionModelMapper = TransactionModelMapper();
    accountMapper = AccountMapper();

    transactionApiService = TransactionApiServiceTestImpl(dio);
    accountApiService = AccountApiServiceTestImpl(dio);

    localTransactionDataSource = LocalTransactionDatasourceImpl(
      db: appDatabase,
      mapper: transactionModelMapper,
    );

    localAccountDataSource = LocalAccountDatasourceImpl(
      db: appDatabase,
      mapper: accountMapper,
    );

    transactionRepository = TransactionRepositoryImpl(
      transactionApiService: transactionApiService,
      localDb: localTransactionDataSource,
    );

    articleRepository = ArticleRepositoryTestImpl();
    bankAccountRepository = BankAccountRepositoryImpl(
      accountApiService: accountApiService,
      localDb: localAccountDataSource,
      iDataBase: iDataBase,
    );
  }
}
