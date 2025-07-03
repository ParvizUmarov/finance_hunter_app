import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String? data;
  final String? emoji;
  final String? subTrailing;
  final String? description;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final bool addTrailing;
  final Color emojiBackgroundColor;
  final String? trailingIconAsset;
  final Color? backgroundColor;
  final Function()? onTap;
  final TextStyle? textStyle;
  final TextEditingController? controller;

  const CustomListTile({
    super.key,
    required this.title,
    this.emoji,
    this.data,
    this.subTrailing,
    this.padding,
    this.description,
    this.trailingIconAsset,
    this.backgroundColor,
    this.onTap,
    this.addTrailing = false,
    this.emojiBackgroundColor = LightAppColors.secondaryBrandColor,
    this.child,
    this.textStyle,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        leading: leadingWidget(),
        title: titleWidget(context),
        trailing: trailingWidget(),
        visualDensity: VisualDensity(horizontal: 0, vertical: 2),
        minVerticalPadding: 0,
        dense: true,
      ),
    );
  }

  Widget titleWidget(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textWidget(context, title, textStyle: textStyle),
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
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (child != null) child!,
              if (controller != null) textField(controller!),
              if (data != null)
                textWidget(context, data ?? "", textStyle: textStyle),
              if (subTrailing != null)
                textWidget(context, subTrailing ?? "", textStyle: textStyle),
            ],
          ),
        ),
      ],
    );
  }

  Widget textWidget(BuildContext context, String text, {TextStyle? textStyle}) {
    final textTheme = textStyle ?? Theme.of(context).textTheme.bodyLarge;
    return Text(text, style: textTheme, overflow: TextOverflow.ellipsis);
  }

  Widget? trailingWidget() => addTrailing || trailingIconAsset != null
      ? SvgPicture.asset(trailingIconAsset ?? Assets.icons.icArrowRight)
      : null;

  Widget? leadingWidget() {
    return emoji == null
        ? null
        : Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: emojiBackgroundColor,
            ),
            child: Center(child: Text(emoji ?? "")),
          );
  }

  Widget textField(TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IntrinsicWidth(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        CurrencyWidget(amount: "")
      ],
    );
  }
}
