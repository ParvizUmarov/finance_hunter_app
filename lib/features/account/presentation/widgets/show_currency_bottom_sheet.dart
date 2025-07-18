import 'package:finance_hunter_app/features/account/data/data.dart';
import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

Future<void> showCurrencyBottomSheet(
  BuildContext context,
  ValueChanged<Currency> onSelectedCurrency,
) async {
  final s = S.of(context);

  final currencies = [
    CurrencyModel(currency: Currency.rub, title: s.russianRubl),
    CurrencyModel(currency: Currency.usd, title: "${s.americanDollar} \$"),
    CurrencyModel(currency: Currency.eur, title: s.euro),
  ];

  final selected = await showModalBottomSheet<Currency>(
    useRootNavigator: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var model in currencies)
            AccountListTile(
              iconAsset: model.currency.icon,
              title: model.title,
              currency: model.currency,
            ),
          AccountListTile(
              background: Theme.of(context).colorScheme.error,
              contentColor: Colors.white,
              iconData: Icons.cancel_outlined,
              title: s.cancel),
        ],
      );
    },
  );
  if (selected != null) {
    onSelectedCurrency(selected);
  }
}
