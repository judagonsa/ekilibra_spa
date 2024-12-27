abstract class SharedPreferencesService {
  Future saveKey<T>(String key, T value);
  Future<T?> getValue<T>(String key);
  Future<bool> remove(String key);
}
