import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/faq.dart';

class FAQProvider with ChangeNotifier {
  List<Faq>? _items = [];

  List<Faq>? get items {
    return [...?_items];
  }

  Future<void> fetchFAQ(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getFAQ',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      // print(response.data);
      FAQResponse faqResponse = FAQResponse.fromJson(response.data);
      _items = faqResponse.faq;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }
}
