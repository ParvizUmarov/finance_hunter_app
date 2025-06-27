import 'package:bloc/bloc.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/data/data.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CurrencyCubit extends Cubit<Currency> {
  CurrencyCubit({required BankAccountRepository bankAccountRepository})
    : _bankAccountRepository = bankAccountRepository,
      super(Currency.rub);

  final BankAccountRepository _bankAccountRepository;

  Future<void> init() async {
    final savedIcon = await _bankAccountRepository.getCurrentCurrency();

    final currency = Currency.values.firstWhere(
      (c) => c.icon == savedIcon,
      orElse: () => Currency.rub,
    );

    emit(currency);
  }

  Future<void> selectCurrency(Currency selectedCurrency) async {
    await _bankAccountRepository.changeCurrency(
      currencyIcon: selectedCurrency.icon,
    );
    emit(selectedCurrency);
  }
}
