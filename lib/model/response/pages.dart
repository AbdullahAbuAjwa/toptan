// To parse this JSON data, do
//
//     final pagesResponse = pagesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

PagesResponse pagesResponseFromJson(String str) =>
    PagesResponse.fromJson(json.decode(str));

String pagesResponseToJson(PagesResponse data) => json.encode(data.toJson());

class PagesResponse extends AppResponse {
  var status;
  var code;
  var message;

  Pages? page;

  //List<Pages>? page;

  PagesResponse({
    status,
    code,
    message,
    this.page,
  }) : super(status: status, code: code, message: message);

  factory PagesResponse.fromJson(Map<String, dynamic> json) => PagesResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        page: Pages.fromJson(json["page"]),
        //  page: List<Pages>.from(json["page"].map((x) => Pages.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "page": page!.toJson(),
        // "page": List<dynamic>.from(page!.map((x) => x.toJson())),
      };
}

class Pages {
  var id;
  var image;
  var title;
  var description;

  Pages({
    this.id,
    this.image,
    this.title,
    this.description,
  });

  factory Pages.fromJson(Map<String, dynamic> json) => Pages(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "description": description,
      };
}
