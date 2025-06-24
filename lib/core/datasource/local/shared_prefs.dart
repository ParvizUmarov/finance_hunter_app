import 'package:shared_preferences/shared_preferences.dart';
import 'i_data_base.dart';

class SharedPrefs implements IDataBase {
  SharedPrefs();

  late final SharedPreferences _prefs;

  @override
  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  @override
  Future<T> get<T>(String key, T defaultValue) async {
    final value = _prefs.get(key);

    if (value is T) {
      return value;
    }

    if (T == int && value is int) return value as T;
    if (T == double && value is double) return value as T;
    if (T == bool && value is bool) return value as T;
    if (T == String && value is String) return value as T;

    if (defaultValue is Enum && value is int) {
      final enumValues = defaultValue.runtimeType as dynamic;
      return enumValues.values[value] as T;
    }

    return defaultValue;
  }

  @override
  Future<bool> set<T>(String key, T value) async {
    switch (value) {
      case bool _:
        return _prefs.setBool(key, value as bool);
      case int _:
        return _prefs.setInt(key, value as int);
      case double _:
        return _prefs.setDouble(key, value as double);
      case String _:
        return _prefs.setString(key, value as String);
      case List<String> _:
        return _prefs.setStringList(key, value as List<String>);
      case Enum _:
        return _prefs.setInt(key, (value as Enum).index);
      default:
        throw Exception('Unsupported type for SharedPreferences');
    }
  }
}