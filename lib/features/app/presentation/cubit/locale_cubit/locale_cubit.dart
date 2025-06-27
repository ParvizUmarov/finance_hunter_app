import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:finance_hunter_app/core/core.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit({required IDataBase iDataBase})
    : _iDataBase = iDataBase,
      super(Locale("ru"));

  final IDataBase _iDataBase;

  Future<void> init() async {
    final currentLocale = await _iDataBase.get(
      KeyStore.appLocale,
      KeyStore.appLocaleDefault,
    );
    emit(Locale(currentLocale));
  }

  Future<void> selectLocale(Locale locale) async {
    await _iDataBase.set(KeyStore.appLocale, locale.languageCode);
    emit(locale);
  }
}
