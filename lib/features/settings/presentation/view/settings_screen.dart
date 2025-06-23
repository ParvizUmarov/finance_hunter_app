import 'package:finance_hunter_app/features/settings/presentation/utils/index.dart';

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
      body: Column(
        children: [
          CustomListTile(title: "Темная тема"),
          CustomListTile(title: "Основной цвет"),
          CustomListTile(title: "Звуки"),
          CustomListTile(title: "Хаптики"),
          CustomListTile(title: "Код пароль"),
          CustomListTile(title: "Синхронизация"),
          CustomListTile(title: "Язык"),
          CustomListTile(title: "О программе"),
        ],
      ),
    );
  }
}
