// To parse this JSON data, do
//
//     final servicePrices = servicePricesFromJson(jsonString);

import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

ServicePricesResponse servicePricesFromJson(String str) =>
    ServicePricesResponse.fromJson(json.decode(str));

String servicePricesToJson(ServicePricesResponse data) =>
    json.encode(data.toJson());

class ServicePricesResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<ServicePricesItem>? items;

  ServicePricesResponse({
    status,
    code,
    message,
    this.items,
  }) : super(message: message, code: code, status: status);

  factory ServicePricesResponse.fromJson(Map<String, dynamic> json) =>
      ServicePricesResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        items: List<ServicePricesItem>.from(
            json["items"].map((x) => ServicePricesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ServicePricesItem {
  int? id;
  ServiceType? serviceType;
  int? serviceId;
  int? price;
  String? status;
  ServiceDetails? service;

  ServicePricesItem({
    this.id,
    this.serviceType,
    this.serviceId,
    this.price,
    this.status,
    this.service,
  });

  factory ServicePricesItem.fromJson(Map<String, dynamic> json) => ServicePricesItem(
        id: json["id"],
        serviceType: ServiceType.fromJson(json["service_type"]),
        serviceId: json["service_id"],
        price: json["price"],
        status: json["status"],
        service: ServiceDetails.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_type": serviceType!.toJson(),
        "service_id": serviceId,
        "price": price,
        "status": status,
        "service": service!.toJson(),
      };
}

class ServiceDetails {
  String? name;
  String? details;
  String? status;

  ServiceDetails({
    this.name,
    this.details,
    this.status,
  });

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
        name: json["name"],
        details: json["details"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "details": details,
        "status": status,
      };
}

class ServiceType {
  int? id;
  String? name;
  String? status;

  ServiceType({
    this.id,
    this.name,
    this.status,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
