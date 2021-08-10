
import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

OrderDetailsResponse orderDetailsResponseFromJson(String str) =>
    OrderDetailsResponse.fromJson(json.decode(str));

String orderDetailsResponseToJson(OrderDetailsResponse data) =>
    json.encode(data.toJson());

class OrderDetailsResponse extends AppResponse {
  OrderDetailsResponse({
    status,
    code,
    message,
    this.orderDetails,
  }) : super(code: code, message: message, status: status);

  var status;
  var code;
  var message;
  OrderDetails? orderDetails;

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      OrderDetailsResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        orderDetails: OrderDetails.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "order": orderDetails!.toJson(),
      };
}

class OrderDetails {
  OrderDetails({
    this.id,
    this.userId,
    this.company,
    this.typeLine,
    this.typeNumber,
    this.numberId,
    this.mobile,
    this.photoId,
    this.photoSimCard,
    this.imageBalance,
    this.comment,
    this.serviceType,
    this.serviceId,
    this.costPrice,
    this.amount,
    this.typeOrder,
    this.status,
    this.createdAt,
    this.walletUser,
    this.number,
    this.lineOperation,
    this.service,
  });

  final id;
  final userId;
  final company;
  final typeLine;
  final typeNumber;
  final numberId;
  final mobile;
  final photoId;
  final photoSimCard;
  final imageBalance;
  final comment;
  ServiceType? serviceType;
  final serviceId;
  final costPrice;
  final amount;
  final typeOrder;
  final status;
  DateTime? createdAt;
  final walletUser;
  final number;
  final lineOperation;
  Service? service;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        id: json["id"],
        userId: json["user_id"],
        company: json["company"],
        typeLine: json["type_line"],
        typeNumber: json["type_number"],
        numberId: json["number_id"],
        mobile: json["mobile"],
        photoId: json["photoId"],
        photoSimCard: json["photoSimCard"],
        imageBalance: json["ImageBalance"],
        comment: json["comment"],
        serviceType: ServiceType.fromJson(json["service_type"]),
        serviceId: json["service_id"],
        costPrice: json["cost_price"],
        amount: json["amount"],
        typeOrder: json["type_order"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        walletUser: json["wallet_user"],
        number: json["number"],
        lineOperation: json["line_operation"],
        service: Service.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company": company,
        "type_line": typeLine,
        "type_number": typeNumber,
        "number_id": numberId,
        "mobile": mobile,
        "photoId": photoId,
        "photoSimCard": photoSimCard,
        "ImageBalance": imageBalance,
        "comment": comment,
        "service_type": serviceType!.toJson(),
        "service_id": serviceId,
        "cost_price": costPrice,
        "amount": amount,
        "type_order": typeOrder,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "wallet_user": walletUser,
        "number": number,
        "line_operation": lineOperation,
        "service": service!.toJson(),
      };
}

class Service {
  Service({
    this.id,
    this.name,
    this.details,
    this.typeId,
    this.costPrice,
    this.status,
  });

  int? id;
  String? name;
  String? details;
  int? typeId;
  int? costPrice;
  String? status;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        typeId: json["type_id"],
        costPrice: json["cost_price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "type_id": typeId,
        "cost_price": costPrice,
        "status": status,
      };
}

class ServiceType {
  ServiceType({
    this.id,
    this.name,
    this.image,
    this.status,
  });

  int? id;
  String? name;
  String? image;
  String? status;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
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
