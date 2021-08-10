
import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

OrderProductResponse orderProductResponseFromJson(String str) =>
    OrderProductResponse.fromJson(json.decode(str));

String orderProductResponseToJson(OrderProductResponse data) =>
    json.encode(data.toJson());

class OrderProductResponse extends AppResponse {
  OrderProductResponse({
    status,
    code,
    message,
    this.orderProducts,
  }) : super(status: status, message: message, code: code);

  var status;
  var code;
  var message;
  List<OrderProducts>? orderProducts;

  factory OrderProductResponse.fromJson(Map<String, dynamic> json) =>
      OrderProductResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        orderProducts: List<OrderProducts>.from(json["orders"].map((x) => OrderProducts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "orders": List<dynamic>.from(orderProducts!.map((x) => x.toJson())),
      };
}

class OrderProducts {
  OrderProducts({
    this.id,
    this.userId,
    this.company,
    this.amount,
    this.typeOrder,
    this.status,
    this.createdAt,
    this.walletUser,
    this.products,
  });

  int? id;
  int? userId;
  final company;
  int? amount;
  int? typeOrder;
  int? status;
  DateTime? createdAt;
  int? walletUser;
  List<ProductElement>? products;

  factory OrderProducts.fromJson(Map<String, dynamic> json) => OrderProducts(
        id: json["id"],
        userId: json["user_id"],
        company: json["company"],
        amount: json["amount"],
        typeOrder: json["type_order"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        walletUser: json["wallet_user"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company": company,
        "amount": amount,
        "type_order": typeOrder,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "wallet_user": walletUser,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class ProductElement {
  ProductElement({
    this.id,
    this.orderId,
    this.userId,
    this.productId,
    this.price,
    this.typePrice,
    this.quantity,
    this.createdAt,
    this.product,
  });

  int? id;
  int? orderId;
  int? userId;
  int? productId;
  int? price;
  String? typePrice;
  int? quantity;
  DateTime? createdAt;
  ProductProduct? product;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        productId: json["product_id"],
        price: json["price"],
        typePrice: json["type_price"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        product: ProductProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "user_id": userId,
        "product_id": productId,
        "price": price,
        "type_price": typePrice,
        "quantity": quantity,
        "created_at": createdAt!.toIso8601String(),
        "product": product!.toJson(),
      };
}

class ProductProduct {
  ProductProduct({
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
  String? price1;
  int? price2;
  int? price3;
  String? name;
  String? image;
  String? status;

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
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
