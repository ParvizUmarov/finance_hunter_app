import 'package:finance_hunter_app/core/core.dart';

class CurrencyWidget extends StatelessWidget {
  final String amount;
  final String currencyAsset;

  const CurrencyWidget({
    super.key,
    required this.amount,
    required this.currencyAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(amount, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: 4),
        SvgPicture.asset(currencyAsset, height: 15,),
      ],
    );
  }
}
