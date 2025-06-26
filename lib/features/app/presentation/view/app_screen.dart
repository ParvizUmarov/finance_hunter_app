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
          create: (context) => CurrencyCubit(iDataBase: iDataBase)..init(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(iDataBase: iDataBase)..init(),
        ),
        BlocProvider(
          create: (context) => InternetStatusCubit(dependencies.connectivity),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Stack(
              children: [
                MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Finance Hunter app',
                  localizationsDelegates: S.delegates,
                  supportedLocales: S.locales,
                  locale: Locale("ru"),
                  theme: state == ThemeMode.dark
                      ? DarkAppTheme.getThemeData()
                      : LightAppTheme.getThemeData(),
                  routerConfig: routeConfig,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: NoInternetConnectionBanner(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
