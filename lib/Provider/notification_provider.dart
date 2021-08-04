
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

}
