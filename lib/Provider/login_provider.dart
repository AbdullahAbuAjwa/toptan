import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/login.dart';
import 'package:toptan/model/user_response.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<UserResponse> signIn({
    var email,
    var password,
  }) async {
    Login loginRequest = Login(
      deviceType: AppShared.deviceType,
      email: email,
      password: password,
    );

    var response = await AppShared.dio!.post(
      '${AppShared.baseUrl}login',
      data: loginRequest.toJson(),
    );

    UserResponse userResponse = UserResponse.fromJson(response.data);
    if (userResponse.status) {
      AppShared.currentUser = userResponse;
      await AppShared.sharedPreferencesController!.setIsLogin(true);
      notifyListeners();
    }
    return userResponse;
  }

  Future<UserResponse> logout() async {
    var response = await AppShared.dio!.get(
      '${AppShared.baseUrl}logout',
      options: Options(
        headers: {
          "Authorization": 'Bearer ${AppShared.currentUser!.user!.accessToken}',
          // 'Accept-Language': AppShared.sharedPreferencesController.getAppLang()
        },
      ),
    );

    UserResponse logoutResponse = UserResponse.fromJson(response.data);

    if (logoutResponse.status) {
      //  String appLang = AppShared.sharedPreferencesController.getAppLang();
      AppShared.sharedPreferencesController!.clear();
      await AppShared.sharedPreferencesController!.setIsLogin(false);
      // await AppShared.sharedPreferencesController.setAppLang(appLang);
      print(logoutResponse.status.toString());
    }
    return logoutResponse;
  }
}
