class AppResponse {
  var status;
  var code;
  var message;
  var msg;
  var totalCart;
  var validator;

  AppResponse({this.status, this.code, this.message, this.msg, this.totalCart,this.validator});

  factory AppResponse.fromJson(Map<String, dynamic> json) => AppResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        msg: json["msg"],
        totalCart: json["total_cart"],
    validator: json["validator"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "msg": msg,
        "total_cart": totalCart,
        "validator": validator,
      };
}
