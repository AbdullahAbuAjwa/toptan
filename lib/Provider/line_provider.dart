import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/line.dart';
import 'package:toptan/model/response/line_data.dart';

class LineProvider with ChangeNotifier {
  List<LinesOperation>? _items = [];

  List<LinesOperation>? get items {
    return [...?_items];
  }

  List<Number>? _lineDataItems = [];

  List<Number>? get lineDataItems {
    return [...?_lineDataItems];
  }

  Future<void> getLineOperations(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getLineOperations',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization":
                'Bearer ${AppShared.sharedPreferencesController!.getToken()}'
          },
        ),
      );
      LineResponse lineResponse = LineResponse.fromJson(response.data);
      _items = lineResponse.linesOperations;
      notifyListeners();
    } on Exception {
      throw 'Error';
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<void> getLineOperationData(locale, int? id) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getLineOperationData?line_id=$id',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization":
                'Bearer ${AppShared.sharedPreferencesController!.getToken()}'
          },
        ),
      );
      LineDataResponse lineDataResponse =
          LineDataResponse.fromJson(response.data);
      _lineDataItems = lineDataResponse.numbers;
      notifyListeners();
    } on Exception {
      throw 'Error';
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }
}
