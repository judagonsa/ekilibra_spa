import 'package:ekilibra_spa/app/config/helpers/shared_preferences/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper implements SharedPreferencesService {
  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future saveKey<T>(String key, T value) async {
    final prefs = await getSharedPreferences();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw Exception('Type not found ${T.runtimeType}');
    }
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPreferences();
    if (T == String) {
      return prefs.getString(key) as T?;
    } else if (T == int) {
      return prefs.getInt(key) as T?;
    } else if (T == double) {
      return prefs.getDouble(key) as T?;
    } else if (T == bool) {
      return prefs.getBool(key) as T?;
    } else if (T == List<String>) {
      return prefs.getStringList(key) as T?;
    } else {
      throw Exception('Type not found ${T.runtimeType}');
    }
  }

  @override
  Future<bool> remove(String key) async {
    final prefs = await getSharedPreferences();
    return await prefs.remove(key);
  }
}
