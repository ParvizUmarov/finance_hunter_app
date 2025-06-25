import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';
import 'package:finance_hunter_app/features/app/presentation/cubit/currency_cubit/currency_cubit.dart';
import 'package:finance_hunter_app/features/app/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:finance_hunter_app/features/articles/domain/domain.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/repositories/transaction_repository.dart';
import 'package:finance_hunter_app/ui_kit/ui_kit.dart';

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
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Finance Hunter app',
            localizationsDelegates: S.delegates,
            supportedLocales: S.locales,
            locale: Locale("ru"),
            theme: state == ThemeMode.dark
                ? DarkAppTheme.getThemeData()
                : LightAppTheme.getThemeData(),
            routerConfig: routeConfig,
          );
        }
      ),
    );
  }
}
