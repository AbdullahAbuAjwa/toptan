import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/notification.dart';

class NotificationProvider with ChangeNotifier {
  List<Notifications>? _items = [];

  List<Notifications>? get items {
    return [...?_items];
  }

  Future<void> fetchNotification(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}notifications',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      //  print(response.data);
      NotificationResponse notificationResponse =
          NotificationResponse.fromJson(response.data);
      _items = notificationResponse.notifications;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }
//
/* Future<void> fetchNotification() async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}notifications',
        options: Options(
          headers: {
            //   'Accept-Language': AppShared.sharedPreferencesController.getAppLang(),
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      if (response.statusCode == 200) {
        List<NotificationResponse> listNotification = [];
        var getUsersData = response.data as List;
       // print('getUsersData: ' + getUsersData.toString());
        listNotification =
            getUsersData.map((i) => NotificationResponse.fromJson(i)).toList();
        //print('listUsers: ' + listNotification.toString());
        //  print('items: ' + _items.toString());
        _items = listNotification;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('eeee' + e.toString());
    }
  }
*/
/*Future<NotificationResponse> fetchNotification() async {
    Response response = await AppShared.dio!.get(
      '${AppShared.baseUrl}notifications',
      options: Options(
        headers: {
          //   'Accept-Language': AppShared.sharedPreferencesController.getAppLang(),
          "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
        },
      ),
    );
    NotificationResponse notificationResponse =
        NotificationResponse.fromJson(response.data);
    // print('bbb' + _notificationResponse!.notification!.toList().toString());
    print('nnnnnnnnn' + response.data.toString());
    //  _items!.add(_notificationResponse!.notification);
    notifyListeners();
    print(notificationResponse.notification.length);
    return notificationResponse;
  }
*/
}
