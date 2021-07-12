import 'dart:io';

import 'package:dio/dio.dart';
import 'package:toptan/Helper/share_preferences.dart';
import 'package:toptan/model/user_response.dart';

class AppShared {
  static var baseUrl = 'https://toptan.alberki.com/api/';
  static String deviceType = Platform.isAndroid ? 'android' : 'ios';
  static SharedPreferencesController? sharedPreferencesController;

  // static Map? appLang;

  static Dio? dio = Dio();

  static UserResponse? currentUser;
}
