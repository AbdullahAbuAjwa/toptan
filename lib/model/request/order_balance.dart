
import 'package:dio/dio.dart';

class OrderBalance {
  String? amount;
  MultipartFile? image;

  OrderBalance({this.amount, this.image});

  factory OrderBalance.fromJson(Map<String, dynamic> json) => OrderBalance(
        amount: json["amount"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "image": image,
      };
}
