import 'package:finance_hunter_app/features/settings/presentation/utils/index.dart';

class PasswordListTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color? background;
  final Color? contentColor;
  final Function() onTap;

  const PasswordListTile({
    super.key,
    required this.title,
    required this.iconData,
    this.background,
    this.contentColor,
    required this.onTap,
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
        leading: Icon(iconData, color: contentColor),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: contentColor ?? Theme.of(context).colorScheme.onSurface,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
