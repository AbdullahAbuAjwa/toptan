import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/order.dart';
import 'package:toptan/model/response/order_details.dart';
import 'package:toptan/model/response/order_products.dart';

class OrderProvider with ChangeNotifier {
  List<Order>? _items = [];

  List<Order>? get items {
    return [...?_items];
  }

  List<OrderProducts>? _orderProductItems = [];

  List<OrderProducts>? get orderProductItems {
    return [...?_orderProductItems];
  }

  OrderDetailsResponse? _orderDetailsResponse;

  OrderDetailsResponse? get orderDetailsResponse => _orderDetailsResponse;

  Future<void> getOrders(locale, status) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getOrders',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      OrderResponse orderResponse = OrderResponse.fromJson(response.data);
      // print(response.data.toString());
      if (status == 0) {
        _items = orderResponse.orders!
            .where((element) => element.status == 0)
            .toList();
      } else if (status == 1) {
        _items = orderResponse.orders!
            .where((element) => element.status == 1)
            .toList();
      } else if (status == 2) {
        _items = orderResponse.orders!
            .where((element) => element.status == 2)
            .toList();
      } else if (status == 3) {
        _items = orderResponse.orders!
            .where((element) => element.status == 3)
            .toList();
      } else {
        _items = orderResponse.orders;
      }
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<void> getOrderDetails(locale, id) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getOrderDetails/$id',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      OrderDetailsResponse orderDetailsResponse =
          OrderDetailsResponse.fromJson(response.data);
      // print(response.data.toString());
      _orderDetailsResponse = orderDetailsResponse;

      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<void> getOrdersProduct(locale, status) async {
  //  try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getOrdersProduct',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      OrderProductResponse orderProductResponse =
          OrderProductResponse.fromJson(response.data);
      // print(response.data.toString());
      if (status == 0) {
        _orderProductItems = orderProductResponse.orderProducts!
            .where((element) => element.status == 0)
            .toList();
      } else if (status == 1) {
        _orderProductItems = orderProductResponse.orderProducts!
            .where((element) => element.status == 1)
            .toList();
      } else if (status == 2) {
        _orderProductItems = orderProductResponse.orderProducts!
            .where((element) => element.status == 2)
            .toList();
      } else if (status == 3) {
        _orderProductItems = orderProductResponse.orderProducts!
            .where((element) => element.status == 3)
            .toList();
      } else {
        _orderProductItems = orderProductResponse.orderProducts;
      }
      notifyListeners();
    // } catch (error) {
    //   print('Error: ' + error.toString());
    // }
  }
}
