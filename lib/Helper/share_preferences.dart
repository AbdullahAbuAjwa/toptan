import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  static Future<SharedPreferencesController>? _instance;
  static SharedPreferences? _sharedPreferences;
  static Completer<SharedPreferencesController>? _completer;

  SharedPreferencesController._();

  static Future<SharedPreferencesController?> get instance async {
    if (_instance != null) return _instance;
    _completer = Completer<SharedPreferencesController>();
    await _init();
    _completer!.complete(SharedPreferencesController._());
    return _instance = _completer!.future;
  }

  static Future<void> _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool showIntro() {
    return _sharedPreferences?.getBool('showIntro') ?? true;
  }

  Future<void> notShowIntro(bool value) async {
    await _sharedPreferences?.setBool('showIntro', value);
  }

  bool getIsLogin() {
    return _sharedPreferences?.getBool('isLogin') ?? false;
  }

  Future<void> setIsLogin(bool isLogin) async {
    await _sharedPreferences?.setBool('isLogin', isLogin);
  }

  Future<void> setLang(value) async {
    await _sharedPreferences?.setString('lang', value);
  }

  String getLang() {
    return _sharedPreferences?.getString('lang') ?? 'en';
  }

  //
  // String getAppLang() {
  //   return _sharedPreferences?.getString('lang') ?? 'en';
  //   //?? Constants.SHARED_APP_LANG_DEFAULT_VALUE;
  // }
  //
  // // set the current app lang
  // Future<void> setAppLang(lang) async {
  //   await _sharedPreferences?.setString('lang', lang);
  //   Helpers.changeAppLang(lang);
  // }

  Future<void> clear() async {
    await _sharedPreferences!.clear();
  }
}
