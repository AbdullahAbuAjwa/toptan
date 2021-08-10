import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/work_throw.dart';

class WorkThrowProvider with ChangeNotifier {
  List<WorkThrow>? _items = [];

  List<WorkThrow>? get items {
    return [...?_items];
  }

  Future<void> getWorkThrow(locale) async {
   // try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getWorkThrow',
        options: Options(
          headers: {
            'Accept-Language': locale,
          },
        ),
      );
    //  print(response.data);
      WorkThrowResponse workThrowResponse =
          WorkThrowResponse.fromJson(response.data);
      _items = workThrowResponse.workThrow;
      notifyListeners();
    // } on Exception {
    //   throw 'Error';
    // } catch (error) {
    //   print('Error: ' + error.toString());
    // }
  }
}
