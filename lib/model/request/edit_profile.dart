import 'package:dio/dio.dart';

class EditProfileRequest {
  String? mobile;
  String? name;
  MultipartFile? image;

  EditProfileRequest({
    this.mobile,
    this.name,
    this.image,
  });

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      EditProfileRequest(
        mobile: json["mobile"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "name": name,
        "image": image,
      };
}
