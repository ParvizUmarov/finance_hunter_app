part of 'settings_cubit.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    required ThemeMode themeMode,
    required Color primaryColor,
    required Locale locale,
    required bool hapticsEnabled,
    required bool pinCodeEnabled,
    required bool biometryEnabled,
  }) = _SettingsState;
}