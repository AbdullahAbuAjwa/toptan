import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

class OrderResponse extends AppResponse {
  OrderResponse({
    status,
    code,
    message,
    this.orders,
  }) : super(status: status, message: message, code: code);

  var status;
  var code;
  var message;
  List<Order>? orders;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.userId,
    this.typeOrder,
    this.status,
    this.createdAt,
    this.service,
  });

  int? id;
  int? userId;
  int? typeOrder;
  int? status;
  DateTime? createdAt;
  Service? service;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        typeOrder: json["type_order"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        service: Service.fromJson(json["service"]??{}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type_order": typeOrder,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "service": service!.toJson(),
      };
}

class Service {
  Service({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
