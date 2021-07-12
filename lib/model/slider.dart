import 'dart:convert';

import 'package:toptan/model/app_response.dart';

SliderResponse sliderResponseFromJson(String str) =>
    SliderResponse.fromJson(json.decode(str));

String sliderResponseToJson(SliderResponse data) => json.encode(data.toJson());

class SliderResponse extends AppResponse {


  List<Sliders>? sliders;
  SliderResponse({
    status,
    code,
    message,
    this.sliders,
  })  : super(status: status, code: code, message: message);

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        sliders:
            List<Sliders>.from(json["sliders"].map((x) => Sliders.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "sliders": List<dynamic>.from(sliders!.map((x) => x.toJson())),
      };
}

class Sliders {
  Sliders({
    this.id,
    this.img,
    this.link,
    this.status,
    this.createdAt,
  });

  int? id;
  String? img;
  String? link;
  String? status;
  DateTime? createdAt;

  factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
        id: json["id"],
        img: json["img"],
        link: json["link"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "link": link,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
      };
}
