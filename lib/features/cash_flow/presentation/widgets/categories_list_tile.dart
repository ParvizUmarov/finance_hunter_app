import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

class CategoriesListTile extends StatelessWidget {
  final String title;
  final String amount;
  final String? emoji;
  final bool isTotalAmount;
  final String? transactionDate;
  final String? description;
  final EdgeInsetsGeometry? padding;

  const CategoriesListTile({
    super.key,
    required this.title,
    this.isTotalAmount = false,
    this.emoji,
    required this.amount,
    this.transactionDate,
    this.padding,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
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
        contentPadding:
            padding ?? EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        leading: leadingWidget(),
        title: titleWidget(context),
        trailing: trailingWidget(),
      ),
    );
  }

  Widget titleWidget(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(context, title),
              description == null
                  ? SizedBox.shrink()
                  : textWidget(
                      context,
                      description ?? "",
                      textStyle: textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            textWidget(context, amount),
            transactionDate == null
                ? SizedBox.shrink()
                : textWidget(context, transactionDate ?? ""),
          ],
        ),
      ],
    );
  }

  Widget textWidget(BuildContext context, String text, {TextStyle? textStyle}) {
    final textTheme = textStyle ?? Theme.of(context).textTheme.bodyLarge;
    return Text(text, style: textTheme, overflow: TextOverflow.ellipsis);
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
