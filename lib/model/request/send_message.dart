import 'package:dio/dio.dart';

class SendMessage {
  String? message;
  int? type;
  MultipartFile? image;

  SendMessage({this.message, this.type, this.image});

  factory SendMessage.fromJson(Map<String, dynamic> json) => SendMessage(
        message: json["message"],
        type: json["type"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "type": type,
        "image": image,
      };
}
