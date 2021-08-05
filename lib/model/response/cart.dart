import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

CartResponse cartResponseFromJson(String str) =>
    CartResponse.fromJson(json.decode(str));

String cartResponseToJson(CartResponse data) => json.encode(data.toJson());

class CartResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<MyCart>? myCart;
  var totalCart;

  CartResponse({
    status,
    code,
    message,
    this.myCart,
    this.totalCart,
  }) : super(code: code, message: message, status: status);

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        myCart:
            List<MyCart>.from(json["MyCart"].map((x) => MyCart.fromJson(x))),
        totalCart: json["total_cart"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "MyCart": List<dynamic>.from(myCart!.map((x) => x.toJson())),
        "total_cart": totalCart,
      };
}

class MyCart {
  int? id;
  int? userId;
  int? productId;
  int? price;
  String? typePrice;
  int? quantity;
  DateTime? createdAt;
  ProductCart? productCart;

  MyCart({
    this.id,
    this.userId,
    this.productId,
    this.price,
    this.typePrice,
    this.quantity,
    this.createdAt,
    this.productCart,
  });

  factory MyCart.fromJson(Map<String, dynamic> json) => MyCart(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        price: json["price"],
        typePrice: json["type_price"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        productCart: ProductCart.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "price": price,
        "type_price": typePrice,
        "quantity": quantity,
        "created_at": createdAt!.toIso8601String(),
        "product": productCart!.toJson(),
      };
}

class ProductCart {
  ProductCart({
    this.id,
    this.companyId,
    this.categoryId,
    this.price1,
    this.price2,
    this.price3,
    this.name,
    this.image,
    this.status,
  });

  int? id;
  int? companyId;
  int? categoryId;
  final price1;
  final price2;
  final price3;
  String? name;
  String? image;
  String? status;

  factory ProductCart.fromJson(Map<String, dynamic> json) => ProductCart(
        id: json["id"],
        companyId: json["company_id"],
        categoryId: json["category_id"],
        price1: json["price1"],
        price2: json["price2"],
        price3: json["price3"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "category_id": categoryId,
        "price1": price1,
        "price2": price2,
        "price3": price3,
        "name": name,
        "image": image,
        "status": status,
      };
}
