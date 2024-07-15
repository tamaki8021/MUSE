// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }
  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  ///will clear all the data stored in preference
  Future<void> clearPreferencesData() async {
    await _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return 'primary';
    }
  }

  dynamic get(String key) {
    final value = _sharedPreferences!.get(key);
    return value;
  }

  Future<void> set(String key, dynamic value) async {
    if (value is String) {
      await _sharedPreferences!.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferences!.setDouble(key, value);
    } else if (value is List<String>) {
      await _sharedPreferences!.setStringList(key, value);
    } else {
      throw Exception('Invalid data type');
    }
  }

  Future<void> remove(String key) async {
    await _sharedPreferences!.remove(key);
  }
}
