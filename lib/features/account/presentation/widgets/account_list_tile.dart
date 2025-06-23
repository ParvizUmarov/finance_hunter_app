import 'package:finance_hunter_app/features/account/data/data.dart';
import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

class AccountListTile extends StatelessWidget {
  final String? iconAsset;
  final String title;
  final Currency? currency;
  final IconData? iconData;
  final Color? background;
  final Color? contentColor;

  const AccountListTile({
    super.key,
    this.iconAsset,
    required this.title,
    this.currency,
    this.iconData,
    this.background,
    this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        leading: iconData == null
            ? SvgPicture.asset(iconAsset!)
            : Icon(iconData, color: Colors.white),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: contentColor ?? Theme.of(context).colorScheme.onSurface
          ),
        ),
        onTap: () => context.pop(currency),
      ),
    );
  }
}
