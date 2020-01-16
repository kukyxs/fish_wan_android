import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class ShareUtils {
  static ShareUtils _instance;
  static SharedPreferences _sharedPreferences;
  static Lock _lock = Lock();

  ShareUtils._private();

  static Future<ShareUtils> getInstance() async {
    if (_instance == null) {
      await _lock.synchronized(() async {
        if (_instance == null) {
          var temp = ShareUtils._private();
          _sharedPreferences = await SharedPreferences.getInstance();
          _instance = temp;
        }
      });
    }
    return _instance;
  }

  //region sharedPreferences key 操作
  static bool hasInitialized() {
    return _sharedPreferences != null;
  }

  static bool hasKey(String key) {
    return !hasInitialized() ? false : _sharedPreferences.getKeys().contains(key);
  }

  static Set<String> getKeys() {
    return !hasInitialized() ? null : _sharedPreferences.getKeys();
  }

  static Future<bool> removeKey(String key) {
    return !hasInitialized() || !hasKey(key) ? null : _sharedPreferences.remove(key);
  }

  static Future<bool> clear() {
    return !hasInitialized() ? null : _sharedPreferences.clear();
  }

  //endregion

  //region sharedPreferences put/set 操作
  Future<bool> putString(String key, String value) {
    return !hasInitialized() ? null : _sharedPreferences.setString(key, value);
  }

  String getString(String key, {String def = ''}) {
    return !hasInitialized() ? def : _sharedPreferences.getString(key) ?? def;
  }

  Future<bool> putInt(String key, int value) {
    return !hasInitialized() ? null : _sharedPreferences.setInt(key, value);
  }

  int getInt(String key, {int def = 0}) {
    return !hasInitialized() ? def : _sharedPreferences.getInt(key) ?? def;
  }

  Future<bool> putDouble(String key, double value) {
    return !hasInitialized() ? null : _sharedPreferences.setDouble(key, value);
  }

  double getDouble(String key, {double def = 0.0}) {
    return !hasInitialized() ? def : _sharedPreferences.getDouble(key) ?? def;
  }

  Future<bool> putBool(String key, bool value) {
    return !hasInitialized() ? null : _sharedPreferences.setBool(key, value);
  }

  bool getBool(String key, {bool def = false}) {
    return !hasInitialized() ? def : _sharedPreferences.getBool(key) ?? def;
  }

  Future<bool> putStringList(String key, List<String> value) {
    return !hasInitialized() ? null : _sharedPreferences.setStringList(key, value);
  }

  List<String> getStringList(String key, {List<String> def = const <String>[]}) {
    return !hasInitialized() ? def : _sharedPreferences.getStringList(key) ?? def;
  }
//endregion
}
