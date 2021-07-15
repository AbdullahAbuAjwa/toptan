import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/pos.dart';

class PointOfSaleProvider with ChangeNotifier {
  List<PointOfSale>? _items = [];

  List<PointOfSale>? get items {
    return [...?_items];
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
}
