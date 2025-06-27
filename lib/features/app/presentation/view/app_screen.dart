import 'package:finance_hunter_app/features/app/presentation/cubit/locale_cubit/locale_cubit.dart';
import 'package:finance_hunter_app/features/app/presentation/utils/index.dart';

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
        RepositoryProvider<ArticleRepository>.value(
          value: dependencies.articleRepository,
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
          create: (context) => ThemeCubit(iDataBase: iDataBase)..init(),
        ),
        BlocProvider(
          create: (context) => LocaleCubit(iDataBase: iDataBase)..init(),
        ),
        BlocProvider(
          create: (context) => InternetStatusCubit(dependencies.connectivity),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          final localeCubitState = context.watch<LocaleCubit>().state;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Finance Hunter app',
            localizationsDelegates: S.delegates,
            supportedLocales: S.locales,
            locale: localeCubitState,
            theme: state == ThemeMode.dark
                ? DarkAppTheme.getThemeData()
                : LightAppTheme.getThemeData(),
            routerConfig: routeConfig,
          );
        },
      ),
    );
  }
}
