import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

CompaniesResponse companiesResponseFromJson(String str) =>
    CompaniesResponse.fromJson(json.decode(str));

String companiesResponseToJson(CompaniesResponse data) =>
    json.encode(data.toJson());

class CompaniesResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<Company>? companies;

  CompaniesResponse({
    status,
    code,
    message,
    this.companies,
  });

  factory CompaniesResponse.fromJson(Map<String, dynamic> json) =>
      CompaniesResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        companies: List<Company>.from(
            json["companies"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "companies": List<dynamic>.from(companies!.map((x) => x.toJson())),
      };
}

class Company {
  int? id;
  String? logo;
  String? status;
  String? name;

  Company({
    this.id,
    this.logo,
    this.status,
    this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        logo: json["logo"],
        status: json["status"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
        "status": status,
        "name": name,
      };
}
