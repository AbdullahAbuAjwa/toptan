import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/request/contact_us.dart';
import 'package:toptan/model/response/app_response.dart';

class ContactUsProvider with ChangeNotifier {
  AppResponse? _appResponse;

  AppResponse? get appResponse => _appResponse;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<AppResponse> contactUs(name, mobile, email, message, locale) async {

      ContactUs contact = ContactUs(
        name: name,
        mobile: mobile,
        email: email,
        message: message,
        //  userId: AppShared.currentUser!.user.id,
      );
      Response response = await AppShared.dio!.post(
        '${AppShared.baseUrl}contactUs',
        data: contact.toJson(),
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      AppResponse appResponse = AppResponse.fromJson(response.data);
      _appResponse = appResponse;
      // print(appResponse.message! +
      //     ' ' +
      //     appResponse.status.toString() +
      //     ' ' +
      //     appResponse.code.toString());
      return appResponse;

  }
}
