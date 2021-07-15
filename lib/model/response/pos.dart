import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

PointOfSaleResponse pagesResponseFromJson(String str) =>
    PointOfSaleResponse.fromJson(json.decode(str));

String pagesResponseToJson(PointOfSaleResponse data) =>
    json.encode(data.toJson());

class PointOfSaleResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<PointOfSale>? pointOfSales;

  PointOfSaleResponse({
    status,
    code,
    message,
    this.pointOfSales,
  }) : super(message: message, code: code, status: status);

  factory PointOfSaleResponse.fromJson(Map<String, dynamic> json) =>
      PointOfSaleResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        pointOfSales: List<PointOfSale>.from(
            json["pointOfSales"].map((x) => PointOfSale.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "pointOfSales":
            List<dynamic>.from(pointOfSales!.map((x) => x.toJson())),
      };
}

class PointOfSale {
  PointOfSale({
    this.id,
    this.name,
    this.profileImage,
    this.mobile,
    this.status,
    this.cityId,
  });

  var id;
  var name;
  var profileImage;
  var mobile;
  var status;
  var cityId;

  factory PointOfSale.fromJson(Map<String, dynamic> json) => PointOfSale(
        id: json["id"],
        name: json["name"],
        profileImage: json["profile_image"],
        mobile: json["mobile"],
        status: json["status"],
        cityId: json["city_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_image": profileImage,
        "mobile": mobile,
        "status": status,
        "city_id": cityId,
      };
}
