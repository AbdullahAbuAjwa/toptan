import 'dart:convert';

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

class User {
  int? id;
  String? name;
  String? email;
  String? imageProfile;
  int? cityId;
  int? countryId;
  int? groupId;
  String? status;
  String? address;
  String? accessToken;

  User({
    this.id,
    this.name,
    this.email,
    this.imageProfile,
    this.cityId,
    this.countryId,
    this.groupId,
    this.status,
    this.address,
    this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        imageProfile: json["profile_image"],
        cityId: json["city_id"],
        countryId: json["country_id"],
        status: json["status"],
        accessToken: json['access_token'],
        address: json["address"],
        groupId: json['group_id'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profile_image": imageProfile,
        "city_id": cityId,
        "country_id": countryId,
        "status": status,
        "access_token": accessToken,
        "address": address,
        "group_id": groupId,
      };
}
