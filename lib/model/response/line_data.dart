import 'package:toptan/model/response/app_response.dart';

class LineDataResponse extends AppResponse {
  var status;
  var code;
  var message;
  Operations? operations;
  List<Number>? numbers;

  LineDataResponse({
    status,
    code,
    message,
    this.operations,
    this.numbers,
  }) : super(code: code, message: message, status: status);

  factory LineDataResponse.fromJson(Map<String, dynamic> json) =>
      LineDataResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        operations: Operations.fromJson(json["operations"]),
        numbers:
            List<Number>.from(json["numbers"].map((x) => Number.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "operations": operations!.toJson(),
        "numbers": List<dynamic>.from(numbers!.map((x) => x.toJson())),
      };
}

class Number {
  int? id;
  int? number;
  int? type;
  int? companyId;
  String? status;

  Number({
    this.id,
    this.number,
    this.type,
    this.companyId,
    this.status,
  });

  factory Number.fromJson(Map<String, dynamic> json) => Number(
        id: json["id"],
        number: json["number"],
        type: json["type"],
        companyId: json["company_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "type": type,
        "company_id": companyId,
        "status": status,
      };
}

class Operations {
  int? id;
  int? numberType;
  int? mobileCompanyId;
  int? lineOperationId;
  int? price;
  String? status;

  Operations({
    this.id,
    this.numberType,
    this.mobileCompanyId,
    this.lineOperationId,
    this.price,
    this.status,
  });

  factory Operations.fromJson(Map<String, dynamic> json) => Operations(
        id: json["id"],
        numberType: json["number_type"],
        mobileCompanyId: json["mobile_company_id"],
        lineOperationId: json["line_operation_id"],
        price: json["price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number_type": numberType,
        "mobile_company_id": mobileCompanyId,
        "line_operation_id": lineOperationId,
        "price": price,
        "status": status,
      };
}
