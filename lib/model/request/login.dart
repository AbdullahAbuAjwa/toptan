import 'dart:convert';

Login loginRequestFromJson(String str) => Login.fromJson(json.decode(str));

String loginRequestToJson(Login data) => json.encode(data.toJson());

class Login {
  var password;
  var email;
  var deviceType;

  // String? fcmToken;

  Login({
    this.password,
    this.email,
    this.deviceType,
    // this.fcmToken,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        email: json['user'],
        password: json['password'],
        // fcmToken: json['fcm_token'],
        deviceType: json['device_type'],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "user": email,
        "device_type": deviceType,
        //  "fcm_token": fcmToken,
      };
}
