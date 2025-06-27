import 'dart:developer';

import 'package:finance_hunter_app/features/app/presentation/cubit/locale_cubit/locale_cubit.dart';
import 'package:finance_hunter_app/features/settings/presentation/utils/index.dart';

class SettingsScreen extends StatelessWidget {
  static const String screenName = "settingsScreen";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final themeCubit = context.watch<ThemeCubit>();

    return OfflineAwareScaffold(
      appBar: CustomAppBar(title: s.settings),
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
            onTap: () async {
              await _showLanguageBottomSheet(context, (selectedLocale) async {
                await context.read<LocaleCubit>().selectLocale(selectedLocale);
              });
            },
          ),
          CustomListTile(title: s.aboutProgram),
        ],
      ),
    );
  }

  Future<void> _showLanguageBottomSheet(
    BuildContext context,
    ValueChanged<Locale> onSelect,
  ) async {
    final s = S.of(context);
    final selected = await showModalBottomSheet<Locale>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Русский язык'),
              onTap: () => context.pop(Locale("ru")),
            ),
            ListTile(
              title: Text("English"),
              onTap: () => context.pop(Locale("en")),
            ),
          ],
        );
      },
    );
    if (selected != null) {
      onSelect(selected);
    }
  }
}
