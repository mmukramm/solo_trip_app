import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static PreferenceHelper? _instance;

  PreferenceHelper._internal() {
    _instance = this;
  }
  factory PreferenceHelper() => _instance ?? PreferenceHelper._internal();

  SharedPreferences? _preferences;

  Future<SharedPreferences> _initPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<SharedPreferences?> get preferences async {
    return _preferences ??= await _initPreferences();
  }
}
