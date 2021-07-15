import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/prices.dart';

class PricesProvider with ChangeNotifier {
  List<PricesItem>? _items = [];

  List<PricesItem>? get items {
    return [...?_items];
  }

  Future<void> fetchPrices(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getPrices',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      //  print(response.data);
      PricesResponse faqResponse = PricesResponse.fromJson(response.data);
      _items = faqResponse.items;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }
}
