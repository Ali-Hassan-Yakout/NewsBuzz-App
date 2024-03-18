import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { country, language, theme }

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async {
    return _prefsInstance ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString(PrefKeys key, [String defValue = '']) {
    return _prefsInstance!.getString(key.name) ?? defValue;
  }

  static Future<bool> setString(PrefKeys key, String value) async {
    return _prefsInstance!.setString(key.name, value);
  }

  static bool getBool(PrefKeys key, [bool defValue = false]) {
    return _prefsInstance!.getBool(key.name) ?? defValue;
  }

  static Future<bool> setBool(PrefKeys key, bool value) async {
    return _prefsInstance!.setBool(key.name, value);
  }
}
