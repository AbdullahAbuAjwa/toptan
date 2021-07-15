import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/request/login.dart';
import 'package:toptan/model/response/user.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<UserResponse> signIn(locale, {var email, var password}) async {
    Login loginRequest = Login(
      deviceType: AppShared.deviceType,
      email: email,
      password: password,
    );

    Response response = await AppShared.dio!.post(
      '${AppShared.baseUrl}login',
      data: loginRequest.toJson(),
      options: Options(
        headers: {
          'Accept-Language': locale,
        },
      ),
    );
    UserResponse? userResponse = UserResponse.fromJson(response.data);
    if (userResponse.status) {
      AppShared.currentUser = userResponse;
      await AppShared.sharedPreferencesController!.setIsLogin(true);
      await AppShared.sharedPreferencesController?.setUserData(userResponse);
      // print('ssss' + AppShared.currentUser!.user.email);
      notifyListeners();
    }
    return userResponse;
  }

  Future<UserResponse> logout(locale) async {
    var response = await AppShared.dio!.get(
      '${AppShared.baseUrl}logout',
      options: Options(
        headers: {
          "Authorization": 'Bearer ${AppShared.currentUser!.user!.accessToken}',
          'Accept-Language': locale
        },
      ),
    );
    UserResponse logoutResponse = UserResponse.fromJson(response.data);
    if (logoutResponse.status) {
      AppShared.sharedPreferencesController!.clear();
      await AppShared.sharedPreferencesController!.setIsLogin(false);
      print(logoutResponse.status.toString());
    }
    return logoutResponse;
  }
}
