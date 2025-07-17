import 'package:finance_hunter_app/features/app/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/app_lock/presentation/cubit/app_lock_cubit.dart';
import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/operation_detail/presentation/cubit/operation_detail_cubit.dart';

class AppScreen extends StatelessWidget {
  final AppDependencies dependencies;
  final IDataBase iDataBase;

  const AppScreen({
    super.key,
    required this.dependencies,
    required this.iDataBase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<IDataBase>.value(value: iDataBase),
        RepositoryProvider<TransactionRepository>.value(
          value: dependencies.transactionRepository,
        ),
        RepositoryProvider<CategoryRepository>.value(
          value: dependencies.categoryRepository,
        ),
        RepositoryProvider<BankAccountRepository>.value(
          value: dependencies.bankAccountRepository,
        ),
        BlocProvider(
          create: (context) => CurrencyCubit(
            bankAccountRepository: dependencies.bankAccountRepository,
          )..init(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(
            iDataBase: iDataBase,
            storageService: dependencies.secureStorageService,
          )..init(),
        ),
        BlocProvider(
          create: (context) =>
              AppLockCubit(storageService: dependencies.secureStorageService)
                ..isLockScreenEnabled(),
        ),
        BlocProvider(
          create: (context) => InternetStatusCubit(
            dependencies.connectivity,
            dependencies.transactionRepository,
          ),
        ),
        BlocProvider(
          create: (context) => OperationDetailCubit(
            transactionRepository: dependencies.transactionRepository,
            categoryRepository: dependencies.categoryRepository,
            bankAccountRepository: dependencies.bankAccountRepository,
          ),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Finance Hunter app',
            localizationsDelegates: S.delegates,
            supportedLocales: S.locales,
            locale: state.locale,
            theme: LightAppTheme.getThemeData(primaryColor: state.primaryColor),
            darkTheme: DarkAppTheme.getThemeData(
              primaryColor: state.primaryColor,
            ),
            themeMode: state.themeMode,
            routerConfig: routeConfig,
          );
        },
      ),
    );
  }
}
