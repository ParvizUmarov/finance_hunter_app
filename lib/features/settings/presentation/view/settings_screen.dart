import 'package:finance_hunter_app/features/settings/presentation/utils/index.dart';

class SettingsScreen extends StatelessWidget {
  static const String screenName = "settingsScreen";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final themeCubit = context.watch<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(title: Text(s.settings)),
      body: Column(
        children: [
          CustomListTile(
            title: s.dartTheme,
            child: Switch(
              value: themeCubit.isDarkTheme,
              onChanged: (value) async {
                await context.read<ThemeCubit>().toggleTheme();
              },
            ),
          ),
          CustomListTile(title: s.mainColor),
          CustomListTile(title: s.sounds),
          CustomListTile(title: s.haptics),
          CustomListTile(title: s.password),
          CustomListTile(title: s.synchronization),
          CustomListTile(
            title: s.language,
            trailingIconAsset: Assets.icons.arrowRight,
          ),
          CustomListTile(title: s.aboutProgram),
        ],
      ),
    );
  }
}
