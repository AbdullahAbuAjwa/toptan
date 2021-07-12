import 'dart:convert';

import 'package:toptan/model/user.dart';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  var status;
  var code;
  var user;
  var message;

  UserResponse({
    this.status,
    this.code,
    this.user,
    this.message,
  });


factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
      status: json["status"],
      code: json["code"],
      user: User.fromJson(json["user"] ?? {}),
      message: json["message"],
    );

Map<String, dynamic> toJson() => {
      "status": status,
      "code": code,
      "user": user.toJson(),
      "message": message,
    };
}
