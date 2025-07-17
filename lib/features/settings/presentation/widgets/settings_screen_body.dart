import 'package:finance_hunter_app/features/app_lock/presentation/cubit/app_lock_cubit.dart';
import 'package:finance_hunter_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:finance_hunter_app/features/settings/presentation/utils/index.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<SettingsCubit>();

    final s = S.of(context);
    return ListView(
      children: [
        CustomListTile(
          title: s.dartTheme,
          child: Switch(
            value: themeCubit.state.themeMode == ThemeMode.system,
            onChanged: (value) async {
              await context.read<SettingsCubit>().toggleTheme();
            },
          ),
        ),
        CustomListTile(
          title: s.mainColor,
          onTap: () async {
            await _showColorPickerDialog(context);
          },
          trailingIconAsset: Assets.icons.arrowRight,
        ),
        CustomListTile(title: s.sounds),
        CustomListTile(
          title: s.haptics,
          child: Switch(
            value: context.watch<SettingsCubit>().state.hapticsEnabled,
            onChanged: (_) => context.read<SettingsCubit>().toggleHaptics(),
          ),
        ),
        CustomListTile(
          title: s.password,
          child: Switch(
            value: themeCubit.state.pinCodeEnabled,
            onChanged: (value) async {
              if (context.mounted) {
                if (value) {
                  context.read<AppLockCubit>().goToCreatePinCode();
                  const AppLockRoute().push(context);
                } else {
                  await context.read<SettingsCubit>().togglePinCode(value);
                }
              }
            },
          ),
        ),
        CustomListTile(
          title: "Вход по биометрии",
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
            await _showLanguageBottomSheet(context, (selectedLocale) async {
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

  Future<void> _showColorPickerDialog(BuildContext context) async {
    final themeCubit = context.read<SettingsCubit>();
    Color selectedColor = themeCubit.state.primaryColor;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Выберите цвет темы'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                selectedColor = color;
              },
              enableAlpha: false,
              labelTypes: const [ColorLabelType.rgb],
              pickerAreaHeightPercent: 0.7,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                themeCubit.changePrimaryColor(selectedColor);
                Navigator.of(context).pop();
              },
              child: Text(
                'Применить',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
