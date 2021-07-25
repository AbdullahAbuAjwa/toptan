class AppResponse {
  var status;
  var code;
  var message;
  var msg;

  AppResponse({
    this.status,
    this.code,
    this.message,
    this.msg,
  });

  factory AppResponse.fromJson(Map<String, dynamic> json) => AppResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "msg": msg,
      };
}
