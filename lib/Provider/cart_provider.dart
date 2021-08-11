import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/request/add_to_cart.dart';
import 'package:toptan/model/response/app_response.dart';
import 'package:toptan/model/response/cart.dart';

class CartProvider with ChangeNotifier {
  List<MyCart>? _items = [];

  List<MyCart>? get items {
    return [...?_items];
  }

  int? _totalAmount;

  int? get totalAmount {
    return _totalAmount;
  }

  set totalAmount(int? value) {
    _totalAmount = value;
    notifyListeners();
  }

  AppResponse? _appResponse;

  AppResponse? get appResponse => _appResponse;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<AppResponse> addToCart(locale, {productId, price, typePrice}) async {
    AddToCart addToCart =
        AddToCart(productId: productId, price: price, typePrice: typePrice);
    Response response = await AppShared.dio!.post(
      '${AppShared.baseUrl}addToCart',
      data: addToCart.toJson(),
      options: Options(
        headers: {
          'Accept-Language': locale,
          "Authorization":
              'Bearer ${AppShared.sharedPreferencesController!.getToken()}'
        },
      ),
    );
    AppResponse appResponse = AppResponse.fromJson(response.data);
    _appResponse = appResponse;

    return appResponse;
  }

  Future<void> getMyCart(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getMyCart',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
     // print(response.data);
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      _totalAmount = cartResponse.totalCart;
      _items = cartResponse.myCart;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<AppResponse?> changeQuantity(locale, cartId, type) async {
    try {
      Response response =
          await AppShared.dio!.post('${AppShared.baseUrl}changeQuantity',
              data: {'cart_id': cartId.toString(), 'type': type.toString()},
              options: Options(
                headers: {
                  'Accept-Language': locale,
                  "Authorization":
                      'Bearer ${AppShared.currentUser!.user.accessToken}'
                },
              ));

      // print(response.data.toString());
      AppResponse appResponse = AppResponse.fromJson(response.data);
      _appResponse = appResponse;
      _totalAmount = appResponse.totalCart;
      notifyListeners();
    } catch (error) {
      throw error;
    }
    return appResponse;
  }

  Future<AppResponse?> deleteProductCart(locale, id) async {
    try {
      Response response =
          await AppShared.dio!.get('${AppShared.baseUrl}deleteProductCart/$id',
              options: Options(
                headers: {
                  'Accept-Language': locale,
                  "Authorization":
                      'Bearer ${AppShared.currentUser!.user.accessToken}'
                },
              ));

      // print(response.data.toString());
      AppResponse appResponse = AppResponse.fromJson(response.data);
      _items!.removeWhere((element) => element.id == id);
      _appResponse = appResponse;
      _totalAmount = appResponse.totalCart;
      notifyListeners();
    } catch (error) {
      throw error;
    }
    return appResponse;
  }

  Future<AppResponse> checkOut(locale) async {
    Response response = await AppShared.dio!.post(
      '${AppShared.baseUrl}checkOut',
      options: Options(
        headers: {
          'Accept-Language': locale,
          "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
        },
      ),
    );

    AppResponse appResponse = AppResponse.fromJson(response.data);
    _appResponse = appResponse;
    notifyListeners();
    return appResponse;
  }
}
