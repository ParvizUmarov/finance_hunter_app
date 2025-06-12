import 'package:finance_hunter_app/core/core.dart';

class SettingsScreen extends StatelessWidget {
  static const String screenName = "settingsScreen";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.settings),
      ),
      body: const Center(
        child: Text("Settings Screen"),
      ),
    );
  }
}
