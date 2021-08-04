import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/company.dart';

class CompanyProvider with ChangeNotifier {
  List<Company>? _items = [];

  List<Company>? get items {
    return [...?_items];
  }

  List<Company> _itemsFounded = [];

  List<Company> get itemsFounded {
    return [..._itemsFounded];
  }

  Future<void> fetchCompanies(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getCompany',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      //  print(response.data);
      CompaniesResponse companiesResponse =
          CompaniesResponse.fromJson(response.data);
      _items = companiesResponse.companies;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<void> onSearchTextChanged(String text) async {
    _itemsFounded.clear();
    if (text.isEmpty) {
      notifyListeners();
      return;
    }
    _itemsFounded =
        _items!.where((element) => element.name!.contains(text)).toList();
    notifyListeners();
  }
}
