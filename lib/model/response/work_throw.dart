import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

WorkThrowResponse workThrowResponseFromJson(String str) =>
    WorkThrowResponse.fromJson(json.decode(str));

String workThrowResponseToJson(WorkThrowResponse data) =>
    json.encode(data.toJson());

class WorkThrowResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<WorkThrow>? workThrow;

  WorkThrowResponse({
    status,
    code,
    message,
    this.workThrow,
  }) : super(code: code, message: message, status: status);

  factory WorkThrowResponse.fromJson(Map<String, dynamic> json) =>
      WorkThrowResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        workThrow: List<WorkThrow>.from(
            json["work_throw"].map((x) => WorkThrow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "work_throw": List<dynamic>.from(workThrow!.map((x) => x.toJson())),
  };
}

class WorkThrow {
  WorkThrow({
    this.id,
    this.status,
    this.image,
    this.createdAt,
    this.details,
    this.title,
  });

  int? id;
  String? status;
  String? image;
  DateTime? createdAt;
  String? details;
  String? title;

  factory WorkThrow.fromJson(Map<String, dynamic> json) => WorkThrow(
    id: json["id"],
    status: json["status"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    details: json["details"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "image": image,
    "created_at": createdAt!.toIso8601String(),
    "details": details,
    "title": title,
  };
}
