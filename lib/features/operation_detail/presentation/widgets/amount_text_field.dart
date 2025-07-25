import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';
import 'package:intl/intl.dart';

class AmountTextField extends StatelessWidget {
  final TextEditingController controller;

  const AmountTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final separator = NumberFormat.decimalPattern(
      Intl.getCurrentLocale(),
    ).symbols.DECIMAL_SEP;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IntrinsicWidth(
          child: TextField(
            key: const Key('amountTextField'),
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [DecimalInputFormatter(separator)],
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
        CurrencyWidget(amount: ""),
      ],
    );
  }
}
