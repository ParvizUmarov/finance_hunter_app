import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

class CategoriesListTile extends StatelessWidget {
  final String title;
  final String amount;
  final String? emoji;
  final bool isTotalAmount;

  const CategoriesListTile({
    super.key,
    required this.title,
    this.isTotalAmount = false,
    this.emoji,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodyLarge;
    return Container(
      decoration: BoxDecoration(
        color: tileColor(context),
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        leading: leadingWidget(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: textTheme),
            Text(amount, style: textTheme),
          ],
        ),
        trailing: trailingWidget(),
      ),
    );
  }

  Widget? trailingWidget() =>
      isTotalAmount ? null : SvgPicture.asset(Assets.icons.icArrowRight);

  Widget? leadingWidget() {
    return isTotalAmount
        ? null
        : Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: LightAppColors.secondaryBrandColor,
            ),
            child: Center(child: Text(emoji ?? "")),
          );
  }

  Color tileColor(BuildContext context) => isTotalAmount
      ? LightAppColors.secondaryBrandColor
      : Theme.of(context).colorScheme.surface;
}
