class AppResponse {
  bool? status;
  int? code;
  String? message;

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
