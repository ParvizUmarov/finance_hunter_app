import 'package:finance_hunter_app/core/core.dart';
import 'package:flutter/foundation.dart';

final routeConfig = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: !kReleaseMode,
    routes: $appRoutes
);