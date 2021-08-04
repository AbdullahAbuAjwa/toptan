
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/request/order_balance.dart';
import 'package:toptan/model/response/app_response.dart';

class OrderBalanceProvider with ChangeNotifier {
  AppResponse? _appResponse;

  AppResponse? get appResponse => _appResponse;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<AppResponse> createOrderBalance(
      amount, MultipartFile image, locale) async {
    OrderBalance orderBalance = OrderBalance(amount: amount, image: image);
    Response response = await AppShared.dio!.post(
      '${AppShared.baseUrl}orderBalance',
      data: FormData.fromMap(orderBalance.toJson()),
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
}
