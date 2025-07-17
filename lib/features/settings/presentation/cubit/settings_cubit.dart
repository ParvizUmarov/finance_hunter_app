import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/ui_kit/ui_kit.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';

part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required IDataBase iDataBase,
    required SecureStorageService storageService,
  }) : _iDataBase = iDataBase,
       _storageService = storageService,

       super(
         SettingsState(
           themeMode: ThemeMode.light,
           primaryColor: LightAppColors.brandColor,
           locale: Locale('ru'),
           hapticsEnabled: true,
           pinCodeEnabled: false,
         ),
       );

  final IDataBase _iDataBase;
  final SecureStorageService _storageService;

  Future<void> init() async {
    final localeStr = await _iDataBase.get(
      KeyStore.appLocale,
      KeyStore.appLocaleDefault,
    );

    final themeStr = await _iDataBase.get(
      KeyStore.appTheme,
      ThemeMode.system.name,
    );

    final colorHex = await _iDataBase.get(
      KeyStore.tintColor,
      KeyStore.defaultTintColor.toARGB32().toString(),
    );

    final hapticsEnabled = await _iDataBase.get(KeyStore.hapticsEnabled, true);

    final pinCodeEnabled = await _storageService.isPinCodeSet();

    emit(
      SettingsState(
        locale: Locale(localeStr),
        themeMode: ThemeMode.values.byName(themeStr),
        primaryColor: Color(int.parse(colorHex)),
        hapticsEnabled: hapticsEnabled,
        pinCodeEnabled: pinCodeEnabled,
      ),
    );
  }

  Future<void> toggleTheme() async {
    final newMode = state.themeMode == ThemeMode.light
        ? ThemeMode.system
        : ThemeMode.light;

    await _iDataBase.set(KeyStore.appTheme, newMode.name);
    emit(state.copyWith(themeMode: newMode));
  }

  Future<void> changePrimaryColor(Color newColor) async {
    await _iDataBase.set(KeyStore.tintColor, newColor.toARGB32().toString());
    emit(state.copyWith(primaryColor: newColor));
  }

  Future<void> selectLocale(Locale locale) async {
    await _iDataBase.set(KeyStore.appLocale, locale.languageCode);
    emit(state.copyWith(locale: locale));
  }

  Future<void> toggleHaptics() async {
    final newValue = !state.hapticsEnabled;
    await _iDataBase.set(KeyStore.hapticsEnabled, newValue);
    emit(state.copyWith(hapticsEnabled: newValue));
  }

  Future<void> togglePinCode(bool value) async {
    if(!value){
      await _storageService.deletePinCode();
    }
    emit(state.copyWith(pinCodeEnabled: value));
  }

  void maybeHaptic() {
    if (state.hapticsEnabled) {
      HapticFeedback.lightImpact();
    }
  }
}
