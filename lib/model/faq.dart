// To parse this JSON data, do
//
//     final sliderResponse = sliderResponseFromJson(jsonString);

import 'dart:convert';

import 'package:toptan/model/app_response.dart';

FAQResponse sliderResponseFromJson(String str) =>
    FAQResponse.fromJson(json.decode(str));

String sliderResponseToJson(FAQResponse data) => json.encode(data.toJson());

class FAQResponse extends AppResponse {
  FAQResponse({
    status,
    code,
    message,
    this.faq,
  }) : super(code: code, message: message, status: status);

  bool? status;
  int? code;
  String? message;
  List<Faq>? faq;

  factory FAQResponse.fromJson(Map<String, dynamic> json) => FAQResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        faq: List<Faq>.from(json["faq"].map((x) => Faq.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "faq": List<dynamic>.from(faq!.map((x) => x.toJson())),
      };
}

class Faq {
  Faq({
    this.id,
    this.status,
    this.question,
    this.answer,
  });

  int? id;
  String? status;
  String? question;
  String? answer;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        id: json["id"],
        status: json["status"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "question": question,
        "answer": answer,
      };
}
