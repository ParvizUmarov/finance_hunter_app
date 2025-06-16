import 'package:flutter/material.dart';
import '../generated/app_localizations.dart';

class S {
  const S._();

  static List<Locale> get locales => AppLocalizations.supportedLocales;

  static LocalizationsDelegate<AppLocalizations> get delegate =>
      AppLocalizations.delegate;

  static List<LocalizationsDelegate<dynamic>> get delegates =>
      AppLocalizations.localizationsDelegates;

  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context);
}