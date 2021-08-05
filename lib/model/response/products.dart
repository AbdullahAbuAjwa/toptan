// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

ProductsResponse productsResponseFromJson(String str) =>
    ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) =>
    json.encode(data.toJson());

class ProductsResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<Product>? products;

  ProductsResponse({
    status,
    code,
    message,
    this.products,
  }) : super(status: status, message: message, code: code);

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {


  int? id;
  int? companyId;
  int? categoryId;
  String? price1;
  int? price2;
  int? price3;
  String? name;
  String? image;
  String? status;
  Product({
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
  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
