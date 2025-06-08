import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/screens/screens.dart';
import 'package:finance_hunter_app/ui_kit/ui_kit.dart';

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
        //path: '/expensesScreen',
        path: '/',
        name: ExpensesScreen.screenName,
    ),
  ]),
  TypedStatefulShellBranch<IncomeBranch>(
      routes: [
    TypedGoRoute<IncomeRoute>(
        path: '/incomeScreen',
        name: IncomeScreen.screenName),
  ]),
  TypedStatefulShellBranch<AccountBranch>(
      routes: [
    TypedGoRoute<AccountRoute>(
        path: '/accountScreen',
        name: AccountScreen.screenName,
    ),
  ]),
  TypedStatefulShellBranch<ArticlesBranch>(
      routes: [
    TypedGoRoute<ArticlesRoute>(
        path: '/articlesScreen',
        name: ArticlesScreen.screenName),
  ]),
      TypedStatefulShellBranch<SettingsBranch>(
      routes: [
    TypedGoRoute<SettingsRoute>(
        path: '/settingsScreen',
        name: SettingsScreen.screenName),
  ]),
])

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
    return ScaffoldWithNavBar(
      navigationShell: navigationShell,
    );
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
  static final GlobalKey<NavigatorState> $navigatorKey =
      incomeNavigatorKey;
}

class AccountBranch extends StatefulShellBranchData {
  const AccountBranch();

  static const String $restorationScopeId = shellRestorationScopeId;
  static final GlobalKey<NavigatorState> $navigatorKey = accountNavigatorKey;
}

class ArticlesBranch extends StatefulShellBranchData {
  const ArticlesBranch();

  static const String $restorationScopeId = shellRestorationScopeId;
  static final GlobalKey<NavigatorState> $navigatorKey =
      articlesNavigatorKey;
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
    return ExpensesScreen();
  }
}


@immutable
class IncomeRoute extends GoRouteData with _$IncomeRoute {
  const IncomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return IncomeScreen();
  }
}


@immutable
class AccountRoute extends GoRouteData with _$AccountRoute {
  const AccountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AccountScreen();
  }
}


@immutable
class ArticlesRoute extends GoRouteData with _$ArticlesRoute {
  const ArticlesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ArticlesScreen();
  }
}


@immutable
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingsScreen();
  }
}





