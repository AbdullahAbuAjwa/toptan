import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

LineResponse lineResponseFromJson(String str) =>
    LineResponse.fromJson(json.decode(str));

String lineResponseToJson(LineResponse data) => json.encode(data.toJson());

class LineResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<LinesOperation>? linesOperations;

  LineResponse({
    status,
    code,
    message,
    this.linesOperations,
  }) : super(status: status, message: message, code: code);

  factory LineResponse.fromJson(Map<String, dynamic> json) => LineResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        linesOperations: List<LinesOperation>.from(
            json["linesOperations"].map((x) => LinesOperation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "linesOperations":
            List<dynamic>.from(linesOperations!.map((x) => x.toJson())),
      };
}

class LinesOperation {
  int? id;
  int? numberType;
  int? mobileCompanyId;
  int? lineOperationId;
  int? price;
  String? status;
  LineOperations? lineOperations;

  LinesOperation({
    this.id,
    this.numberType,
    this.mobileCompanyId,
    this.lineOperationId,
    this.price,
    this.status,
    this.lineOperations,
  });

  factory LinesOperation.fromJson(Map<String, dynamic> json) => LinesOperation(
        id: json["id"],
        numberType: json["number_type"],
        mobileCompanyId: json["mobile_company_id"],
        lineOperationId: json["line_operation_id"],
        price: json["price"],
        status: json["status"],
        lineOperations: LineOperations.fromJson(json["line_operations"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number_type": numberType,
        "mobile_company_id": mobileCompanyId,
        "line_operation_id": lineOperationId,
        "price": price,
        "status": status,
        "line_operations": lineOperations!.toJson(),
      };
}

class LineOperations {
  LineOperations({
    this.id,
    this.name,
    this.mobileCompanyId,
    this.costPrice,
    this.numberType,
    this.status,
  });

  int? id;
  String? name;
  int? mobileCompanyId;
  int? costPrice;
  int? numberType;
  String? status;

  factory LineOperations.fromJson(Map<String, dynamic> json) => LineOperations(
        id: json["id"],
        name: json["name"],
        mobileCompanyId: json["mobile_company_id"],
        costPrice: json["cost_price"],
        numberType: json["number_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile_company_id": mobileCompanyId,
        "cost_price": costPrice,
        "number_type": numberType,
        "status": status,
      };
}
