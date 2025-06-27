import 'package:bloc/bloc.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:meta/meta.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({required IDataBase iDataBase})
    : _iDataBase = iDataBase,
      super(ThemeMode.light);

  final IDataBase _iDataBase;
  ThemeMode _currentThemeMode = ThemeMode.light;
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  Future<void> init() async {
    final currentTheme = await _iDataBase.get(
      KeyStore.appTheme,
      ThemeMode.light.name,
    );

    _currentThemeMode = switch (currentTheme) {
      "light" => ThemeMode.light,
      "dark" => ThemeMode.dark,
      String() => ThemeMode.light,
    };

    _isDarkTheme = _currentThemeMode == ThemeMode.dark;

    emit(_currentThemeMode);
  }

  Future<void> toggleTheme() async {
    _currentThemeMode = switch (_currentThemeMode.name) {
      "light" => ThemeMode.dark,
      "dark" => ThemeMode.light,
      String() => ThemeMode.light,
    };

    _isDarkTheme = _currentThemeMode == ThemeMode.dark;

    await _iDataBase.set(KeyStore.appTheme, _currentThemeMode.name);
    emit(_currentThemeMode);
  }
}
