import 'package:finance_hunter_app/core/core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actionIcon,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(children: [Text(title)]),
      actions: [IconButton(onPressed: onActionPressed, icon: Icon(actionIcon))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
