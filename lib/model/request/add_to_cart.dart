class AddToCart {
  final productId;
  final price;
  final typePrice;

  AddToCart({this.productId, this.price, this.typePrice});

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
        productId: json["product_id"],
        price: json["price"],
        typePrice: json["type_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "price": price,
        "type_price": typePrice,
      };
}
