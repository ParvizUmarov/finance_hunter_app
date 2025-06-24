import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/app/presentation/cubit/currency_cubit/currency_cubit.dart';

class CurrencyWidget extends StatelessWidget {
  final String amount;

  const CurrencyWidget({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final currencyCubit = context.watch<CurrencyCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(amount, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: 4),
        SvgPicture.asset(currencyCubit.state.icon, height: 15),
      ],
    );
  }
}
