import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/request/create_point_of_sale.dart';
import 'package:toptan/model/response/app_response.dart';
import 'package:toptan/model/response/pos.dart';

class PointOfSaleProvider with ChangeNotifier {
  List<PointOfSale>? _items = [];

  List<PointOfSale>? get items {
    return [...?_items];
  }

  AppResponse? _appResponse;

  AppResponse? get appResponse => _appResponse;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchPos(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getPointOfSale',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      //  print(response.data);
      PointOfSaleResponse pointOfSaleResponse =
          PointOfSaleResponse.fromJson(response.data);
      _items = pointOfSaleResponse.pointOfSales;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<AppResponse> addPointOfSale(locale,
      {name,
      mobile,
      email,
      password,
      government,
      address,
      profileImage}) async {
    CreatePointOfSale createPointOfSale = CreatePointOfSale(
      name: name,
      mobile: mobile,
      email: email,
      password: password,
      government: government,
      address: address,
      profileImage: profileImage,
    );
    Response response = await AppShared.dio!.post(
      '${AppShared.baseUrl}addPointOfSale',
      data: FormData.fromMap(createPointOfSale.toJson()),
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
