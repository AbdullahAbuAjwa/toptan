import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/pages.dart';

class PagesProvider with ChangeNotifier {
  PagesResponse? _pagesResponse;

  PagesResponse? get pagesResponse => _pagesResponse;

  Future<void> fetchPages(locale, pageNumber) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getPages/$pageNumber',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      // print(response.data);
      PagesResponse pagesResponse = PagesResponse.fromJson(response.data);
      _pagesResponse = pagesResponse;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }
}
