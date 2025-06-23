import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

Future<void> showCurrencyBottomSheet(
  BuildContext context,
  ValueChanged<String> onSelectedSortingType,
) async {
  final textStyle = Theme.of(context).textTheme.bodyLarge;

  final selected = await showModalBottomSheet<String>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: SvgPicture.asset(Assets.icons.mdiRuble),
            title: Text("Российский рубль ₽", style: textStyle),
            onTap: () => context.pop(""),
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.icons.mdiDollar),
            title: Text("Американский доллар \$", style: textStyle),
            onTap: () => context.pop(""),
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.icons.mdiEuro),
            title: Text("Евро", style: textStyle),
            onTap: () => context.pop(""),
          ),
          Container(
            color: Theme.of(context).colorScheme.error,
            child: ListTile(
              leading: Icon(Icons.cancel_outlined, color: Colors.white),
              title: Text(
                "Отмена",
                style: textStyle?.copyWith(color: Colors.white),
              ),
              onTap: () => context.pop(),
            ),
          ),
        ],
      );
    },
  );
  if (selected != null) {
    onSelectedSortingType(selected);
  }
}
