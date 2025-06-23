import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/domain.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/repositories/transaction_repository.dart';
import 'package:finance_hunter_app/ui_kit/ui_kit.dart';

class AppScreen extends StatelessWidget {
  final AppDependencies dependencies;

  const AppScreen({super.key, required this.dependencies});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<TransactionRepository>.value(
          value: dependencies.transactionRepository,
        ),
        RepositoryProvider<ArticleRepository>.value(
          value: dependencies.articleRepository,
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Finance Hunter app',
        localizationsDelegates: S.delegates,
        supportedLocales: S.locales,
        locale: Locale("ru"),
        theme: LightAppTheme.getThemeData(),
        routerConfig: routeConfig,
      ),
    );
  }
}
