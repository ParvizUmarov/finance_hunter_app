// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeShellRoute];

RouteBase get $homeShellRoute => StatefulShellRouteData.$route(
  restorationScopeId: HomeShellRoute.$restorationScopeId,
  factory: $HomeShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      navigatorKey: ExpensesBranch.$navigatorKey,
      restorationScopeId: ExpensesBranch.$restorationScopeId,

      routes: [
        GoRouteData.$route(
          path: '/',
          name: 'expensesScreen',

          factory: _$ExpensesRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'myExpensesScreen',
              name: 'myExpensesScreen',

              factory: _$MyExpensesRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'transactionHistoryScreen',
              name: 'transactionHistoryScreen',

              factory: _$TransactionHistoryRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: IncomeBranch.$navigatorKey,
      restorationScopeId: IncomeBranch.$restorationScopeId,

      routes: [
        GoRouteData.$route(
          path: '/incomeScreen',
          name: 'incomeScreen',

          factory: _$IncomeRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: AccountBranch.$navigatorKey,
      restorationScopeId: AccountBranch.$restorationScopeId,

      routes: [
        GoRouteData.$route(
          path: '/accountScreen',
          name: 'accountScreen',

          factory: _$AccountRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: ArticlesBranch.$navigatorKey,
      restorationScopeId: ArticlesBranch.$restorationScopeId,

      routes: [
        GoRouteData.$route(
          path: '/articlesScreen',
          name: 'articlesScreen',

          factory: _$ArticlesRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: SettingsBranch.$navigatorKey,
      restorationScopeId: SettingsBranch.$restorationScopeId,

      routes: [
        GoRouteData.$route(
          path: '/settingsScreen',
          name: 'settingsScreen',

          factory: _$SettingsRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $HomeShellRouteExtension on HomeShellRoute {
  static HomeShellRoute _fromState(GoRouterState state) =>
      const HomeShellRoute();
}

mixin _$ExpensesRoute on GoRouteData {
  static ExpensesRoute _fromState(GoRouterState state) => const ExpensesRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$MyExpensesRoute on GoRouteData {
  static MyExpensesRoute _fromState(GoRouterState state) =>
      const MyExpensesRoute();

  @override
  String get location => GoRouteData.$location('/myExpensesScreen');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$TransactionHistoryRoute on GoRouteData {
  static TransactionHistoryRoute _fromState(GoRouterState state) =>
      const TransactionHistoryRoute();

  @override
  String get location => GoRouteData.$location('/transactionHistoryScreen');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$IncomeRoute on GoRouteData {
  static IncomeRoute _fromState(GoRouterState state) => const IncomeRoute();

  @override
  String get location => GoRouteData.$location('/incomeScreen');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$AccountRoute on GoRouteData {
  static AccountRoute _fromState(GoRouterState state) => const AccountRoute();

  @override
  String get location => GoRouteData.$location('/accountScreen');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ArticlesRoute on GoRouteData {
  static ArticlesRoute _fromState(GoRouterState state) => const ArticlesRoute();

  @override
  String get location => GoRouteData.$location('/articlesScreen');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settingsScreen');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
