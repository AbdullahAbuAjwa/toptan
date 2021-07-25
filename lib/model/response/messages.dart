// To parse this JSON data, do
//
//     final chatResponse = chatResponseFromJson(jsonString);

import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

ChatResponse chatResponseFromJson(String str) =>
    ChatResponse.fromJson(json.decode(str));

String chatResponseToJson(ChatResponse data) => json.encode(data.toJson());

class ChatResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<Chat>? chat;

  ChatResponse({
    status,
    code,
    message,
    this.chat,
  }) : super(message: message, code: code, status: status);

  factory ChatResponse.fromJson(Map<String, dynamic> json) => ChatResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        chat: List<Chat>.from(json["chat"].map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "chat": List<dynamic>.from(chat!.map((x) => x.toJson())),
      };
}

class Chat {
  Chat({
    this.message,
    this.sender,
    this.read,
    this.type,
    this.createdAt,
    this.userName,
    this.date,
    this.time,
  });

  String? message;
  int? sender;
  int? read;
  int? type;
  DateTime? createdAt;
  String? userName;
  DateTime? date;
  String? time;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        message: json["message"],
        sender: json["sender"],
        read: json["read"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        userName: json["user_name"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "sender": sender,
        "read": read,
        "type": type,
        "created_at": createdAt!.toIso8601String(),
        "user_name": userName,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
      };
}
