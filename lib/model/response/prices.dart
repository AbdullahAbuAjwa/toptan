import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

PricesResponse pricesResponseFromJson(String str) =>
    PricesResponse.fromJson(json.decode(str));

String pricesResponseToJson(PricesResponse data) => json.encode(data.toJson());

class PricesResponse extends AppResponse {
  PricesResponse({
    status,
    code,
    message,
    this.items,
  }) : super(status: status, code: code, message: message);

  var status;
  var code;
  var message;
  List<PricesItem>? items;

  factory PricesResponse.fromJson(Map<String, dynamic> json) => PricesResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        items: List<PricesItem>.from(
            json["items"].map((x) => PricesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class PricesItem {
  PricesItem({
    this.id,
    this.price,
    this.status,
    this.lineOperations,
  });

  int? id;
  int? price;
  String? status;
  LineOperations? lineOperations;

  factory PricesItem.fromJson(Map<String, dynamic> json) => PricesItem(
        id: json["id"],
        price: json["price"],
        status: json["status"],
        lineOperations: LineOperations.fromJson(json["line_operations"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "status": status,
        "line_operations": lineOperations!.toJson(),
      };
}

class LineOperations {
  LineOperations({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory LineOperations.fromJson(Map<String, dynamic> json) => LineOperations(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
