import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  late SharedPreferences _prefs;

  LocalStorage._internal();

  static LocalStorage get instance => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> writeString({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  Future<String?> readString({required String key}) async {
    return _prefs.getString(key);
  }

  Future<void> writeBool({required String key, required bool value}) async {
    await _prefs.setBool(key, value);
  }

  Future<bool?> readBool({required String key}) async {
    return _prefs.getBool(key);
  }

  Future<void> delete({required String key}) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }

  Future<void> writeMultiple(Map<String, String> data) async {
    for (var entry in data.entries) {
      await _prefs.setString(entry.key, entry.value);
    }
  }




}

Future<void> initializeLocalStorage() async {
  await LocalStorage.instance.init();
}
