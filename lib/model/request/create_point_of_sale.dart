import 'package:dio/dio.dart';

class CreatePointOfSale {
  String? name;
  String? mobile;
  String? email;
  String? password;
  int? government;
  String? address;
  MultipartFile? profileImage;

  CreatePointOfSale(
      {this.name,
      this.mobile,
      this.email,
      this.password,
      this.government,
      this.address,
      this.profileImage});

  factory CreatePointOfSale.fromJson(Map<String, dynamic> json) => CreatePointOfSale(
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        password: json["password"],
        government: json["government"],
        address: json["address"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "email": email,
        "password": password,
        "government": government,
        "address": address,
        "profile_image": profileImage,
      };
}
