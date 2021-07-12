import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/slider.dart';

class SliderProvider with ChangeNotifier {
  List<Sliders>? _items = [];

  List<Sliders>? get items {
    return [...?_items];
  }

  Future<void> fetchSliders(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getSliders',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
   //   print(response.data);
      SliderResponse sliderResponse =
          SliderResponse.fromJson(response.data);
      _items = sliderResponse.sliders;
      notifyListeners();
    } on Exception {
      throw 'Error';
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }
}
