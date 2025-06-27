import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';
import 'package:finance_hunter_app/features/account/presentation/cubit/account_cubit.dart';
import 'package:finance_hunter_app/features/analysis/data/data.dart';
import 'package:finance_hunter_app/features/analysis/presentation/cubit/analysis_cubit.dart';
import 'package:finance_hunter_app/features/articles/domain/domain.dart';
import 'package:finance_hunter_app/features/articles/presentation/cubit/articles_cubit.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/transaction_date_filter.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/repositories/transaction_repository.dart';
import 'package:finance_hunter_app/features/cash_flow/presentation/cubit/transaction_cubit/transaction_cubit.dart';
import 'package:finance_hunter_app/features/features.dart';
import 'package:finance_hunter_app/ui_kit/ui_kit.dart';

import '../../features/cash_flow/data/models/transaction_kind.dart';

part 'app_route.g.dart';

const shellRestorationScopeId = 'shellRestorationScopeId';

final expensesNavigatorKey = GlobalKey<NavigatorState>();
final incomeNavigatorKey = GlobalKey<NavigatorState>();
final accountNavigatorKey = GlobalKey<NavigatorState>();
final articlesNavigatorKey = GlobalKey<NavigatorState>();
final settingsNavigatorKey = GlobalKey<NavigatorState>();

@TypedStatefulShellRoute<HomeShellRoute>(
  branches: [
    TypedStatefulShellBranch<ExpensesBranch>(
      routes: [
        TypedGoRoute<ExpensesRoute>(
          path: '/',
          name: CashFlowScreen.expensesScreenName,
          routes: [
            TypedGoRoute<MyExpensesRoute>(
              path: 'myExpensesScreen',
              name: MyExpensesScreen.screenName,
            ),
            TypedGoRoute<TransactionHistoryRoute>(
              path: 'transactionHistoryScreen',
              name: TransactionHistoryScreen.screenName,
            ),
            TypedGoRoute<AnalysisRoute>(
              path: 'analysisScreen',
              name: AnalysisScreen.screenName,
            ),
            TypedGoRoute<DetailCategoryRoute>(
              path: 'detailCategoryScreen',
              name: DetailCategoryScreen.screenName,
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<IncomeBranch>(
      routes: [
        TypedGoRoute<IncomeRoute>(
          path: '/incomeScreen',
          name: CashFlowScreen.incomeScreenName,
        ),
      ],
    ),
    TypedStatefulShellBranch<AccountBranch>(
      routes: [
        TypedGoRoute<AccountRoute>(
          path: '/accountScreen',
          name: AccountScreen.screenName,
        ),
      ],
    ),
    TypedStatefulShellBranch<ArticlesBranch>(
      routes: [
        TypedGoRoute<ArticlesRoute>(
          path: '/articlesScreen',
          name: ArticlesScreen.screenName,
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: [
        TypedGoRoute<SettingsRoute>(
          path: '/settingsScreen',
          name: SettingsScreen.screenName,
        ),
      ],
    ),
  ],
)
//==============================================================================
//***************************   HOME SHELL ROUTE   *****************************
//==============================================================================
class HomeShellRoute extends StatefulShellRouteData {
  const HomeShellRoute();

  static const String $restorationScopeId = shellRestorationScopeId;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ScaffoldWithNavBar(navigationShell: navigationShell);
  }
}

//==============================================================================
//***************************   SHELL BRANCHES   *******************************
//==============================================================================

class ExpensesBranch extends StatefulShellBranchData {
  const ExpensesBranch();

  static const String $restorationScopeId = shellRestorationScopeId;
  static final GlobalKey<NavigatorState> $navigatorKey = expensesNavigatorKey;
}

class IncomeBranch extends StatefulShellBranchData {
  const IncomeBranch();

  static const String $restorationScopeId = shellRestorationScopeId;
  static final GlobalKey<NavigatorState> $navigatorKey = incomeNavigatorKey;
}

class AccountBranch extends StatefulShellBranchData {
  const AccountBranch();

  static const String $restorationScopeId = shellRestorationScopeId;
  static final GlobalKey<NavigatorState> $navigatorKey = accountNavigatorKey;
}

class ArticlesBranch extends StatefulShellBranchData {
  const ArticlesBranch();

  static const String $restorationScopeId = shellRestorationScopeId;
  static final GlobalKey<NavigatorState> $navigatorKey = articlesNavigatorKey;
}

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();

  static const String $restorationScopeId = shellRestorationScopeId;
  static final GlobalKey<NavigatorState> $navigatorKey = settingsNavigatorKey;
}

//==============================================================================
//********************************   ROUTES   **********************************
//==============================================================================

@immutable
class ExpensesRoute extends GoRouteData with _$ExpensesRoute {
  const ExpensesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final kind = ExpensesTransaction();
    return BlocProvider(
      create: (context) => TransactionCubit(
        kind: kind,
        repository: context.read<TransactionRepository>(),
      )..getTransactionsForPeriod(),
      child: CashFlowScreen(kind: kind),
    );
  }
}

@immutable
class IncomeRoute extends GoRouteData with _$IncomeRoute {
  const IncomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final kind = IncomeTransaction();
    return BlocProvider(
      create: (context) => TransactionCubit(
        kind: kind,
        repository: context.read<TransactionRepository>(),
      )..getTransactionsForPeriod(),
      child: CashFlowScreen(kind: kind),
    );
  }
}

@immutable
class MyExpensesRoute extends GoRouteData with _$MyExpensesRoute {
  const MyExpensesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyExpensesScreen();
  }
}

@immutable
class TransactionHistoryRoute extends GoRouteData
    with _$TransactionHistoryRoute {
  final TransactionKind $extra;

  const TransactionHistoryRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) =>
          TransactionCubit(
            kind: $extra,
            repository: context.read<TransactionRepository>(),
          )..getTransactionsForPeriod(
            TransactionDateFilter(
              startDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
              endDate: TransactionDateFilter.defaultEndTime(),
            ),
          ),
      child: TransactionHistoryScreen(kind: $extra),
    );
  }
}

@immutable
class AnalysisRoute extends GoRouteData with _$AnalysisRoute {
  final TransactionKind $extra;

  const AnalysisRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => AnalysisCubit(
        kind: $extra,
        repository: context.read<TransactionRepository>(),
      )..getGroupedTransactionByCategory(),
      child: AnalysisScreen(kind: $extra),
    );
  }
}

@immutable
class DetailCategoryRoute extends GoRouteData with _$DetailCategoryRoute {
  final GroupedTransactionModel $extra;

  const DetailCategoryRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailCategoryScreen(transactionModel: $extra,);
  }
}

@immutable
class AccountRoute extends GoRouteData with _$AccountRoute {
  const AccountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) =>
          AccountCubit(repository: context.read<BankAccountRepository>())
            ..getAccounts(),
      child: AccountScreen(),
    );
  }
}

@immutable
class ArticlesRoute extends GoRouteData with _$ArticlesRoute {
  const ArticlesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) =>
          ArticlesCubit(repository: context.read<ArticleRepository>())
            ..getArticles(),
      child: ArticlesScreen(),
    );
  }
}

@immutable
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}
