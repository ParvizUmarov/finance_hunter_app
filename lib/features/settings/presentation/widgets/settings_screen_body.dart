import 'package:finance_hunter_app/features/settings/presentation/utils/index.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.watch<SettingsCubit>();
    final pinCodeEnabled = settingsCubit.state.pinCodeEnabled;

    final s = S.of(context);
    return ListView(
      children: [
        CustomListTile(
          title: s.dartTheme,
          child: Switch(
            value: settingsCubit.state.themeMode == ThemeMode.system,
            onChanged: (value) async {
              await context.read<SettingsCubit>().toggleTheme();
            },
          ),
        ),
        CustomListTile(
          title: s.mainColor,
          onTap: () async {
            await showColorPickerDialog(context);
          },
          trailingIconAsset: Assets.icons.arrowRight,
        ),
        CustomListTile(
          title: s.haptics,
          child: Switch(
            value: context.watch<SettingsCubit>().state.hapticsEnabled,
            onChanged: (_) => context.read<SettingsCubit>().toggleHaptics(),
          ),
        ),
        CustomListTile(
          title: s.password,
          onTap: () async {
            await showOverlaySheet(
              context: context,
              pinCodeEnabled: pinCodeEnabled,
              onSelect: (AppPasswordStatus status) async {
                await context.read<SettingsCubit>().togglePinCode(
                  status,
                  context,
                );
              },
            );
          },
          trailingIconAsset: Assets.icons.arrowRight,
          data: pinCodeEnabled ? s.on : s.off,
        ),
        CustomListTile(
          title: s.loginByBiometric,
          child: Switch(
            value: context.watch<SettingsCubit>().state.biometryEnabled,
            onChanged: (value) =>
                context.read<SettingsCubit>().toggleBiometrics(value),
          ),
        ),
        CustomListTile(
          title: s.language,
          trailingIconAsset: Assets.icons.arrowRight,
          onTap: () async {
            await showLanguageBottomSheet(context, (selectedLocale) async {
              await context.read<SettingsCubit>().selectLocale(selectedLocale);
            });
          },
        ),
        CustomListTile(
          title: s.aboutProgram,
          trailingIconAsset: Assets.icons.arrowRight,
          onTap: () {
            AboutAppRoute().push(context);
          },
        ),
      ],
    );
  }
}
