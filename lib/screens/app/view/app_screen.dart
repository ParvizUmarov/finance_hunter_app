import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/ui_kit/ui_kit.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Finance Hunter app',
      theme: AppTheme.getThemeData(),
      routerConfig: routeConfig,
    );
  }
}
