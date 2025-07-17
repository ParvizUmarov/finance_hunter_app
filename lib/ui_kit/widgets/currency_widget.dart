import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/app/presentation/cubit/currency_cubit/currency_cubit.dart';

class CurrencyWidget extends StatelessWidget {
  final String amount;
  final Color? color;

  const CurrencyWidget({super.key, required this.amount, this.color});

  @override
  Widget build(BuildContext context) {
    final currencyCubit = context.watch<CurrencyCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            amount,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: color ?? Theme.of(context).colorScheme.onSurface,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          currencyCubit.state.icon,
          height: 15,
          colorFilter: ColorFilter.mode(
            color ?? Theme.of(context).colorScheme.onSurface,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
