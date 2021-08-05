import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/company.dart';
import 'package:toptan/model/response/products.dart';

class CompaniesProductsProvider with ChangeNotifier {
  List<Company>? _companyItems = [];

  List<Company>? get companyItems {
    return [...?_companyItems];
  }

  List<Product>? _productItems = [];

  List<Product>? get productItems {
    return [...?_productItems];
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
      _companyItems = companiesResponse.companies;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<void> getProductsByCompanyId(locale, int companyId) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getProductsByCompanyId/$companyId/0',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      //  print(response.data);
      ProductsResponse productsResponse =
          ProductsResponse.fromJson(response.data);
      _productItems = productsResponse.products;
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
    _itemsFounded = _companyItems!
        .where((element) => element.name!.contains(text))
        .toList();
    notifyListeners();
  }
}
