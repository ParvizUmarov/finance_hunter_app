import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/core/datasource/local/local_datasource/local_account_datasource_impl.dart';
import 'package:finance_hunter_app/core/datasource/local/local_datasource/local_category_datasource_impl.dart';
import 'package:finance_hunter_app/core/datasource/local/local_datasource/local_transaction_pending_datasource_impl.dart';
import 'package:finance_hunter_app/features/account/data/data.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';
import 'package:finance_hunter_app/features/articles/domain/domain.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:local_auth/local_auth.dart';

class AppDependencies {
  final Dio dio;
  final TransactionRepository transactionRepository;
  final BankAccountRepository bankAccountRepository;
  final CategoryRepository categoryRepository;
  final Connectivity connectivity;

  final LocalAccountDataSource localAccountDataSource;
  final LocalCategoryDatasource localCategoryDatasource;
  final LocalTransactionDataSource localTransactionDataSource;
  final LocalPendingTransactionDatasource localPendingTransactionDatasource;
  final AppDatabase appDatabase;

  final AccountMapper accountMapper;
  final TransactionModelMapper transactionModelMapper;
  final CategoryMapper categoryMapper;

  final TransactionApiService transactionApiService;
  final AccountApiService accountApiService;
  final CategoryApiService categoryApiService;

  final SecureStorageService secureStorageService;
  final LocalAuthentication localAuthentication;

  AppDependencies({
    Dio? dio,
    AppDatabase? appDatabase,
    Connectivity? connectivity,
    TransactionModelMapper? transactionModelMapper,
    AccountMapper? accountMapper,
    CategoryMapper? categoryMapper,
    TransactionApiService? transactionApiService,
    AccountApiService? accountApiService,
    CategoryApiService? categoryApiService,
    SecureStorageService? secureStorageService,
    LocalAuthentication? localAuthentication,
    LocalTransactionDataSource? localTransactionDataSource,
    LocalCategoryDatasource? localCategoryDatasource,
    LocalPendingTransactionDatasource? localPendingTransactionDatasource,
    LocalAccountDataSource? localAccountDataSource,
    TransactionRepository? transactionRepository,
    BankAccountRepository? bankAccountRepository,
    CategoryRepository? categoryRepository,
    IDataBase? iDataBase,
  })  : dio = dio ?? DioHandler.dio,
        appDatabase = appDatabase ?? AppDatabase(),
        connectivity = connectivity ?? Connectivity(),
        transactionModelMapper = transactionModelMapper ?? TransactionModelMapper(),
        accountMapper = accountMapper ?? AccountMapper(),
        categoryMapper = categoryMapper ?? CategoryMapper(),
        transactionApiService = transactionApiService ?? TransactionApiServiceImpl(dio ?? DioHandler.dio),
        accountApiService = accountApiService ?? AccountApiServiceImpl(dio ?? DioHandler.dio),
        categoryApiService = categoryApiService ?? CategoryApiServiceImpl(dio ?? DioHandler.dio),
        secureStorageService = secureStorageService ?? SecureStorageService(),
        localAuthentication = localAuthentication ?? LocalAuthentication(),
        localTransactionDataSource = localTransactionDataSource ??
            LocalTransactionDatasourceImpl(
              db: appDatabase ?? AppDatabase(),
              mapper: transactionModelMapper ?? TransactionModelMapper(),
            ),
        localCategoryDatasource = localCategoryDatasource ??
            LocalCategoryDatasourceImpl(
              db: appDatabase ?? AppDatabase(),
              mapper: categoryMapper ?? CategoryMapper(),
            ),
        localPendingTransactionDatasource = localPendingTransactionDatasource ??
            LocalPendingTransactionDatasourceImpl(
              db: appDatabase ?? AppDatabase(),
              mapper: transactionModelMapper ?? TransactionModelMapper(),
            ),
        localAccountDataSource = localAccountDataSource ??
            LocalAccountDatasourceImpl(
              db: appDatabase ?? AppDatabase(),
              mapper: accountMapper ?? AccountMapper(),
            ),
        transactionRepository = transactionRepository ??
            TransactionRepositoryImpl(
              transactionApiService: transactionApiService ?? TransactionApiServiceImpl(dio ?? DioHandler.dio),
              localDb: localTransactionDataSource ??
                  LocalTransactionDatasourceImpl(
                    db: appDatabase ?? AppDatabase(),
                    mapper: transactionModelMapper ?? TransactionModelMapper(),
                  ),
            ),
        bankAccountRepository = bankAccountRepository ??
            BankAccountRepositoryImpl(
              accountApiService: accountApiService ?? AccountApiServiceImpl(dio ?? DioHandler.dio),
              localDb: localAccountDataSource ??
                  LocalAccountDatasourceImpl(
                    db: appDatabase ?? AppDatabase(),
                    mapper: accountMapper ?? AccountMapper(),
                  ),
              iDataBase: iDataBase ?? SharedPrefsImpl(),
            ),
        categoryRepository = categoryRepository ??
            CategoryRepositoryImpl(
              categoryApiService: categoryApiService ?? CategoryApiServiceImpl(dio ?? DioHandler.dio),
              localCategoryDb: localCategoryDatasource ??
                  LocalCategoryDatasourceImpl(
                    db: appDatabase ?? AppDatabase(),
                    mapper: categoryMapper ?? CategoryMapper(),
                  ),
            );
}
