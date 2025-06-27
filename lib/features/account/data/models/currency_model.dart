import 'package:finance_hunter_app/ui_kit/ui_kit.dart';

class CurrencyModel {
  final Currency currency;
  final String title;

  CurrencyModel({required this.currency, required this.title});
}

enum Currency {
  rub,
  usd,
  eur;

  String get icon {
    switch (this) {
      case Currency.rub:
        return Assets.icons.mdiRuble;
      case Currency.usd:
        return Assets.icons.mdiDollar;
      default:
        return Assets.icons.mdiEuro;
    }
  }
}
