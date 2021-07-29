import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/request/order_service.dart';
import 'package:toptan/model/response/app_response.dart';
import 'package:toptan/model/response/service.dart';
import 'package:toptan/model/response/service_details.dart';

class ServiceProvider with ChangeNotifier {
  AppResponse? _appResponse;
  List<Service>? _items = [];
  List<ServiceElement>? _serviceItems = [];
  List<Service>? _serviceItemsFounded = [];
  bool _isLoading = false;

  List<Service>? get items {
    return [...?_items];
  }

  List<ServiceElement>? get serviceItems {
    return [...?_serviceItems];
  }

  List<Service>? get serviceItemsFounded {
    return [...?_serviceItemsFounded];
  }

  set serviceItemsFounded(value) {
    _serviceItemsFounded = value;
    notifyListeners();
  }

  AppResponse? get appResponse => _appResponse;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchServicesTypes(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getServicesTypes',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      //   print(response.data);
      ServiceResponse serviceResponse = ServiceResponse.fromJson(response.data);
      _items = serviceResponse.services;
      notifyListeners();
    } on Exception {
      throw 'Error';
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<void> fetchServicesById(locale, int id) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getServicesByServiceTypeId/$id',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      ServiceDetailsResponse serviceDetailsResponse =
          ServiceDetailsResponse.fromJson(response.data);
      _serviceItems = serviceDetailsResponse.services;
      notifyListeners();
    } on Exception {
      throw 'Error';
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<AppResponse> orderServiceByServiceTypeId(locale, int typeId,
      {mobile, comment, photoId, serviceID}) async {
    OrderService createPointOfSale = OrderService(
      mobile: mobile,
      comment: comment,
      photoId: photoId,
      serviceId: serviceID,
    );
    Response response = await AppShared.dio!.post(
      '${AppShared.baseUrl}orderServiceByServiceTypeId/$typeId',
      data: FormData.fromMap(createPointOfSale.toJson()),
      options: Options(
        headers: {
          'Accept-Language': locale,
          "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
        },
      ),
    );
    AppResponse appResponse = AppResponse.fromJson(response.data);
    _appResponse = appResponse;
    return appResponse;
  }

  Future<void> onSearchTextChanged(String text) async {
    _serviceItemsFounded!.clear();
    if (text.isEmpty) {
      notifyListeners();

      return;
    }
    _serviceItemsFounded =
        _items!.where((element) => element.name!.contains(text)).toList();
    notifyListeners();
  }
}
