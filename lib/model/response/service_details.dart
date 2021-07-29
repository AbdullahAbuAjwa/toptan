// To parse this JSON data, do
//
//     final serviceDetailsResponse = serviceDetailsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

ServiceDetailsResponse serviceDetailsResponseFromJson(String str) =>
    ServiceDetailsResponse.fromJson(json.decode(str));

String serviceDetailsResponseToJson(ServiceDetailsResponse data) =>
    json.encode(data.toJson());

class ServiceDetailsResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<ServiceElement>? services;

  ServiceDetailsResponse({
    status,
    code,
    message,
    this.services,
  }) : super(message: message, status: status, code: code);

  factory ServiceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      ServiceDetailsResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        services: List<ServiceElement>.from(
            json["services"].map((x) => ServiceElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class ServiceElement {
  ServiceElement({
    this.id,
    this.serviceType,
    this.serviceId,
    this.status,
    this.service,
  });

  var id;
  int? serviceType;
  int? serviceId;
  String? status;
  ServiceItem? service;

  factory ServiceElement.fromJson(Map<String, dynamic> json) => ServiceElement(
        id: json["id"],
        serviceType: json["service_type"],
        serviceId: json["service_id"],
        status: json["status"],
        service: ServiceItem.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_type": serviceType,
        "service_id": serviceId,
        "status": status,
        "service": service!.toJson(),
      };
}

class ServiceItem {
  ServiceItem(
      {this.id,
      this.name,
      this.details,
      this.costPrice,
      this.status,
      this.selected = false});

  int? id;
  String? name;
  String? details;
  int? costPrice;
  String? status;
  bool selected;

  factory ServiceItem.fromJson(Map<String, dynamic> json) => ServiceItem(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        costPrice: json["cost_price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "cost_price": costPrice,
        "status": status,
      };
}
