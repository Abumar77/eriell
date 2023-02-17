import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService implements IPreferencesService {
  @override
  void putInt(String key, int? value) {
    SharedPreferences.getInstance()
        .then((SharedPreferences prefs) => prefs.setInt(key, value!));
  }

  @override
  void putBool(
    String key,
    bool? value,
  ) {
    SharedPreferences.getInstance()
        .then((SharedPreferences prefs) => prefs.setBool(key, value!));
  }

  @override
  void putString(
    String key,
    String? value,
  ) {
    SharedPreferences.getInstance()
        .then((SharedPreferences prefs) => prefs.setString(key, value!));
  }

  void deleteString(String key) {
    SharedPreferences.getInstance()
        .then((SharedPreferences prefs) => prefs.remove(key));
  }

  int? getInt(String key) {
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      return prefs.getInt(key);
    });
  }

  @override
  Future<bool> getBool(String key) async {
    return SharedPreferences.getInstance().then((SharedPreferences prefs) {
      return prefs.getBool(key) ?? true;
    });
  }

  @override
  Future<String?> getString(String key) async {
    return await SharedPreferences.getInstance()
        .then((SharedPreferences prefs) {
      return prefs.getString(key);
    });
  }
}

abstract class IPreferencesService {
  void putInt(String key, int? value);

  void putString(
    String key,
    String? value,
  );

  void putBool(String key, bool? value);

  Future<bool> getBool(String key);

  Future<String?> getString(String key);
}
