import 'dart:convert';

import 'package:toptan/model/app_response.dart';

NotificationResponse notificationResponseFromJson(String str) =>
    NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) =>
    json.encode(data.toJson());

class NotificationResponse extends AppResponse {
  List<Notifications>? notifications;

  NotificationResponse({
    status,
    code,
    message,
    this.notifications,
  }) : super(status: status, message: message, code: code);

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        notifications: List<Notifications>.from(
            json["notifications"].map((x) => Notifications.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "notifications":
            List<dynamic>.from(notifications!.map((x) => x.toJson())),
      };
}

class Notifications {
  Notifications({
    this.id,
    this.userId,
    this.orderId,
    this.groupId,
    this.title,
    this.message,
    this.createdAt,
  });

  int? id;
  int? userId;
  int? orderId;
  int? groupId;
  String? title;
  String? message;
  DateTime? createdAt;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        groupId: json["group_id"],
        title: json["title"],
        message: json["message"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "group_id": groupId,
        "title": title,
        "message": message,
        "created_at": createdAt!.toIso8601String(),
      };
}
