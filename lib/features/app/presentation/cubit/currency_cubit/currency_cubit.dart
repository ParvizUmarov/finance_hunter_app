import 'package:bloc/bloc.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CurrencyCubit extends Cubit<Currency> {
  CurrencyCubit({required IDataBase iDataBase})
    : _iDataBase = iDataBase,
      super(Currency.rub);

  final IDataBase _iDataBase;

  Future<void> init() async {
    final savedIcon = await _iDataBase.get<String>(
      KeyStore.currency,
      Currency.rub.icon,
    );

    final currency = Currency.values.firstWhere(
          (c) => c.icon == savedIcon,
      orElse: () => Currency.rub,
    );

    emit(currency);
  }

  void selectCurrency(Currency selectedCurrency) {
    _iDataBase.set<String>(KeyStore.currency, selectedCurrency.icon);
    emit(selectedCurrency);
  }
}
