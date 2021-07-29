import 'package:dio/dio.dart';

class OrderService {
  String? mobile;
  String? comment;
  MultipartFile? photoId;
  int? serviceId;

  OrderService(
      {this.mobile, this.comment, this.photoId, required this.serviceId});

  factory OrderService.fromJson(Map<String, dynamic> json) => OrderService(
        mobile: json["mobile"],
        comment: json["comment"],
        photoId: json["photoId"],
        serviceId: json["service_id"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "comment": comment,
        "photoId": photoId,
        "service_id": serviceId,
      };
}
