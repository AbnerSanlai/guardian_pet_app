import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorageService {
  SharedPreferencesStorageService();

  Future<String?> getString(String key) {
    return SharedPreferences.getInstance()
        .then((instance) => instance.getString(key));
  }

  Future<bool> remove(String key) {
    return SharedPreferences.getInstance()
        .then((instance) => instance.remove(key));
  }

  Future<bool> setString(
    String key,
    String value,
  ) {
    return SharedPreferences.getInstance()
        .then((instance) => instance.setString(key, value));
  }
}
