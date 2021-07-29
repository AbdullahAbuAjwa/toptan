// To parse this JSON data, do
//
//     final serviceResponse = serviceResponseFromJson(jsonString);

import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

ServiceResponse serviceResponseFromJson(String str) =>
    ServiceResponse.fromJson(json.decode(str));

String serviceResponseToJson(ServiceResponse data) =>
    json.encode(data.toJson());

class ServiceResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<Service>? services;

  ServiceResponse({
    status,
    code,
    message,
    this.services,
  }) : super(message: message, status: status, code: code);

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      ServiceResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  int? id;
  String? name;
  String? image;
  String? status;

  Service({
    this.id,
    this.name,
    this.image,
    this.status,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
      };
}
