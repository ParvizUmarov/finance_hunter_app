import 'i_data_base.dart';

class FakeDatabase implements IDataBase {
  final Map<String, dynamic> _storage = {};

  @override
  Future<void> init() async {
  }

  @override
  Future<T> get<T>(String key, T defaultValue) async {
    final value = _storage[key];

    if (value is T) {
      return value;
    }

    return defaultValue;
  }

  @override
  Future<bool> set<T>(String key, T value) async {
    _storage[key] = value;
    return true;
  }
}
