import 'package:finance_hunter_app/features/settings/presentation/utils/index.dart';

Future<void> showOverlaySheet({
  required BuildContext context,
  required bool pinCodeEnabled,
  required ValueChanged<AppPasswordStatus> onSelect,
}) async {
  final s = S.of(context);
  final selectPasswordStatus = await showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!pinCodeEnabled)
            PasswordListTile(
              title: s.turnOn,
              iconData: Icons.lock_outlined,
              onTap: () => context.pop(AppPasswordStatus.turnOn),
            ),

          if (pinCodeEnabled)
            PasswordListTile(
              title: s.turnOff,
              iconData: Icons.lock_open_sharp,
              onTap: () => context.pop(AppPasswordStatus.turnOff),
            ),
          if (pinCodeEnabled)
            PasswordListTile(
              title: s.editThePasscode,
              iconData: Icons.edit,
              onTap: () => context.pop(AppPasswordStatus.edit),
            ),
          if (pinCodeEnabled)
            PasswordListTile(
              title: s.deletePasscode,
              iconData: Icons.delete_outline,
              background: Theme.of(context).colorScheme.error,
              contentColor: Colors.white,
              onTap: () => context.pop(AppPasswordStatus.delete),
            ),
          SizedBox(height: 20),
        ],
      );
    },
  );

  if (selectPasswordStatus != null) {
    onSelect(selectPasswordStatus);
  }
}

Future<void> showLanguageBottomSheet(
  BuildContext context,
  ValueChanged<Locale> onSelect,
) async {
  final s = S.of(context);
  final selected = await showModalBottomSheet<Locale>(
    context: context,
    useRootNavigator: true,
    useSafeArea: true,
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
          SizedBox(height: 20),
        ],
      );
    },
  );
  if (selected != null) {
    onSelect(selected);
  }
}

Future<void> showColorPickerDialog(BuildContext context) async {
  final s = S.of(context);
  final themeCubit = context.read<SettingsCubit>();
  Color selectedColor = themeCubit.state.primaryColor;

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(s.selectThemeColor),
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
            child: Text(s.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              themeCubit.changePrimaryColor(selectedColor);
              Navigator.of(context).pop();
            },
            child: Text(
              s.apply,
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
