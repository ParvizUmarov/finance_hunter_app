import 'dart:ui';

import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';
import 'package:finance_hunter_app/ui_kit/gen/assets.gen.dart';

class KeyStore {
  KeyStore._();

  static const String appLocale = 'appLocale';
  static const String appLocaleDefault = "ru";

  static const String currency = 'currency';
  static String appCurrencyDefault = Assets.icons.mdiRuble;

  static const String appTheme = 'appTheme';

  static const String startDateKey = 'startDateKey';
  static const String endDateKey = 'endDateKey';

  static const String tintColor = 'tintColor';
  static const Color defaultTintColor = LightAppColors.brandColor;

  static const String hapticsEnabled = 'hapticsEnabled';

  static const String pinCodeEnabled = 'pinCodeEnabled';
}
