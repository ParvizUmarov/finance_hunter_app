// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $homeShellRoute,
  $splashRoute,
  $appLockRoute,
];

RouteBase get $homeShellRoute => StatefulShellRouteData.$route(
  restorationScopeId: HomeShellRoute.$restorationScopeId,
  factory: $HomeShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      navigatorKey: ExpensesBranch.$navigatorKey,
      restorationScopeId: ExpensesBranch.$restorationScopeId,

      routes: [
        GoRouteData.$route(
          path: '/expensesScreen',
          name: 'expensesScreen',

          factory: _$ExpensesRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'transactionHistoryScreen',
              name: 'transactionHistoryScreen',

              factory: _$TransactionHistoryRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'analysisScreen',
              name: 'analysisScreen',

              factory: _$AnalysisRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'detailCategoryScreen',
              name: 'detailCategoryScreen',

              factory: _$DetailCategoryRoute._fromState,
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
  String get location => GoRouteData.$location('/expensesScreen');

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
      TransactionHistoryRoute($extra: state.extra as TransactionKind);

  TransactionHistoryRoute get _self => this as TransactionHistoryRoute;

  @override
  String get location =>
      GoRouteData.$location('/expensesScreen/transactionHistoryScreen');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin _$AnalysisRoute on GoRouteData {
  static AnalysisRoute _fromState(GoRouterState state) =>
      AnalysisRoute($extra: state.extra as TransactionKind);

  AnalysisRoute get _self => this as AnalysisRoute;

  @override
  String get location =>
      GoRouteData.$location('/expensesScreen/analysisScreen');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin _$DetailCategoryRoute on GoRouteData {
  static DetailCategoryRoute _fromState(GoRouterState state) =>
      DetailCategoryRoute($extra: state.extra as GroupedTransactionModel);

  DetailCategoryRoute get _self => this as DetailCategoryRoute;

  @override
  String get location =>
      GoRouteData.$location('/expensesScreen/detailCategoryScreen');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
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

RouteBase get $splashRoute => GoRouteData.$route(
  path: '/',
  name: 'splashScreen',

  factory: _$SplashRoute._fromState,
);

mixin _$SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

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

RouteBase get $appLockRoute => GoRouteData.$route(
  path: '/appLockScreen',
  name: 'appLockScreen',

  factory: _$AppLockRoute._fromState,
);

mixin _$AppLockRoute on GoRouteData {
  static AppLockRoute _fromState(GoRouterState state) => const AppLockRoute();

  @override
  String get location => GoRouteData.$location('/appLockScreen');

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
