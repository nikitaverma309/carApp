import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static Future<void> saveString(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future<void> saveBool(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  static Future<void> saveInt(String key, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, value);
  }

  static Future<void> saveDouble(String key, double value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble(key, value);
  }

  static Future<String?> loadString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<int?> loadInt(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key);
  }

  static Future<double?> loadDouble(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getDouble(key);
  }

  static Future<bool?> loadBool(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

  static Future<bool?> loadIsActive(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(key) != null) {
      bool? rt = preferences.getBool(key);
      return rt;
    } else {
      return true;
    }
  }

  static Future deleteAllLocalData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.clear();
  }
}

class SpKey {

  /// auth
  static String authByGoogle = "auth-by-google";

  /// reading settings
  static String theme = "theme";
  static String fontSize = "font-size";
  static String displayColorIndex = "display-color-index";

  /// reminder settings
  static String reminderToggle = "reminder-toggle";
  static String hourTime = "hour-time";
  static String minuteTime = "minute-time";
}
