
abstract class IDataBase {

  Future<void> init();

  Future<T> get<T>(String key, T defaultValue);

  Future<bool> set<T>(String key, T value);

}