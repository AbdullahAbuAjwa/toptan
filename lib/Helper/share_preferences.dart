import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/user.dart';
import 'package:easy_localization/easy_localization.dart';

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

  String? getToken() {
    return _sharedPreferences?.getString('access_token');
  }

  getUserData() {
    return UserResponse()
      ..user = User(
        id: _sharedPreferences?.getInt('id'),
        name: _sharedPreferences?.getString('name'),
        email: _sharedPreferences?.getString('email'),
        imageProfile: _sharedPreferences?.getString('profile_image'),
        cityId: _sharedPreferences?.getInt('city_id'),
        countryId: _sharedPreferences?.getInt('country_id'),
        groupId: _sharedPreferences?.getInt('group_id'),
        status: _sharedPreferences?.getString('status'),
        address: _sharedPreferences?.getString('address'),
        accessToken: _sharedPreferences?.getString('access_token') ??
            AppShared.currentUser!.user.accessToken,
        mobile: _sharedPreferences?.getString('mobile') ?? '',
      );
  }

  Future<void> setUserData(UserResponse? userResponse) async {
    await _sharedPreferences?.setInt('id', userResponse!.user!.id);
    await _sharedPreferences?.setString('name', userResponse!.user!.name);
    await _sharedPreferences?.setString('email', userResponse!.user.email);
    await _sharedPreferences?.setString(
        'profile_image', userResponse!.user!.imageProfile);
    await _sharedPreferences?.setInt('city_id', userResponse!.user.cityId);
    await _sharedPreferences?.setInt(
        'country_id', userResponse!.user.countryId);
    await _sharedPreferences?.setInt('group_id', userResponse!.user.groupId);
    await _sharedPreferences?.setString('status', userResponse!.user.status);
    await _sharedPreferences?.setString('address', userResponse!.user.address);
    await _sharedPreferences?.setString(
        'access_token', userResponse!.user.accessToken);
    await _sharedPreferences?.setString(
        'mobile', userResponse!.user.mobile ?? '');
  }

  Future<void> setUserDataAfterEdit(UserResponse? userResponse) async {
    await _sharedPreferences?.setInt('id', userResponse!.user!.id);
    await _sharedPreferences?.setString('name', userResponse!.user!.name);
    await _sharedPreferences?.setString('email', userResponse!.user.email);
    await _sharedPreferences?.setString(
        'profile_image', userResponse!.user!.imageProfile);
    await _sharedPreferences?.setInt('city_id', userResponse!.user.cityId);
    await _sharedPreferences?.setInt(
        'country_id', userResponse!.user.countryId);
    await _sharedPreferences?.setInt('group_id', userResponse!.user.groupId);
    await _sharedPreferences?.setString('status', userResponse!.user.status);
    await _sharedPreferences?.setString('address', userResponse!.user.address);

    await _sharedPreferences?.setString(
        'mobile', userResponse!.user.mobile ?? '');
  }

  Future<void> clear() async {
    await _sharedPreferences!.clear();
  }
}
