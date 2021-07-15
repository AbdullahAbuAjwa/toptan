class AppResponse {
  var status;
  var code;
  var message;

  AppResponse({
    this.status,
    this.code,
    this.message,
  });

  factory AppResponse.fromJson(Map<String, dynamic> json) => AppResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
      };
}
