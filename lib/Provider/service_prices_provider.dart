import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/service_prices.dart';

class ServicePricesProvider with ChangeNotifier {
  List<ServicePricesItem>? _items = [];

  List<ServicePricesItem>? get items {
    return [...?_items];
  }

  Future<void> fetchServicePrices(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getServicePrices',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      //  print(response.data);
      ServicePricesResponse servicePricesResponse =
          ServicePricesResponse.fromJson(response.data);
      _items = servicePricesResponse.items;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }
}
