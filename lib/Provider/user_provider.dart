import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/request/change_password.dart';
import 'package:toptan/model/request/edit_profile.dart';
import 'package:toptan/model/request/login.dart';
import 'package:toptan/model/response/app_response.dart';
import 'package:toptan/model/response/user.dart';

class UserProvider with ChangeNotifier {
  EditProfileResponse? _editProfileResponse;

  EditProfileResponse? get editProfileResponse => _editProfileResponse;
  AppResponse? _appResponse;

  AppResponse? get appResponse => _appResponse;

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
      notifyListeners();
    }
    return userResponse;
  }

  Future<EditProfileResponse> editUserProfile(locale,
      {String? name, MultipartFile? image, String? mobile}) async {
    EditProfileRequest editProfileRequest =
        EditProfileRequest(name: name, mobile: mobile, image: image);

    Response response = await AppShared.dio!.post(
      '${AppShared.baseUrl}editUserProfile',
      data: FormData.fromMap(editProfileRequest.toJson()),
      options: Options(
        headers: {
          "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}',
          'Accept-Language': locale
        },
      ),
    );
    EditProfileResponse editProfileResponse =
        EditProfileResponse.fromJson(response.data);
    if (editProfileResponse.status) {
      _editProfileResponse = editProfileResponse;
      Map<String, dynamic> map = editProfileResponse.user!.toJson();
      AppShared.currentUser!.user = User.fromJson(map);
      await AppShared.sharedPreferencesController
          ?.setUserDataAfterEdit(AppShared.currentUser);
      notifyListeners();
    }
    return editProfileResponse;
  }

  Future<AppResponse> changePassword(locale,
      {oldPassword, newPassword, confirmPassword}) async {
    ChangePassword changePassword = ChangePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    Response response = await AppShared.dio!.post(
      '${AppShared.baseUrl}changePassword',
      data: changePassword.toJson(),
      options: Options(
        headers: {
          'Accept-Language': locale,
          "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
        },
      ),
    );
    AppResponse appResponse = AppResponse.fromJson(response.data);
    _appResponse = appResponse;

    return appResponse;
  }

  Future<AppResponse> logout(locale) async {
    var response = await AppShared.dio!.get(
      '${AppShared.baseUrl}logout',
      options: Options(
        headers: {
          "Authorization": 'Bearer ${AppShared.currentUser!.user!.accessToken}',
          'Accept-Language': locale
        },
      ),
    );
    AppResponse logoutResponse = AppResponse.fromJson(response.data);
    _appResponse = logoutResponse;
    if (logoutResponse.status) {
      await AppShared.sharedPreferencesController!.setIsLogin(false);
      AppShared.sharedPreferencesController!.clear();
      AppShared.sharedPreferencesController!.notShowIntro(false);
    }
    return logoutResponse;
  }
}
