// To parse this JSON data, do
//
//     final banckAccountResponse = banckAccountResponseFromJson(jsonString);

import 'dart:convert';

import 'package:toptan/model/response/app_response.dart';

BankAccountResponse bankAccountResponseFromJson(String str) =>
    BankAccountResponse.fromJson(json.decode(str));

String bankAccountResponseToJson(BankAccountResponse data) =>
    json.encode(data.toJson());

class BankAccountResponse extends AppResponse {
  var status;
  var code;
  var message;
  List<Account>? accounts;

  BankAccountResponse({
    status,
    code,
    message,
    this.accounts,
  }) : super(status: status, code: code, message: message);

  factory BankAccountResponse.fromJson(Map<String, dynamic> json) =>
      BankAccountResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        accounts: List<Account>.from(
            json["Accounts"].map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "Accounts": List<dynamic>.from(accounts!.map((x) => x.toJson())),
      };
}

class Account {
  Account({
    this.id,
    this.nameBank,
    this.nameAccount,
    this.numAccount,
    this.status,
  });

  int? id;
  String? nameBank;
  String? nameAccount;
  String? numAccount;
  String? status;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        nameBank: json["name_bank"],
        nameAccount: json["name_account"],
        numAccount: json["num_account"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_bank": nameBank,
        "name_account": nameAccount,
        "num_account": numAccount,
        "status": status,
      };
}
