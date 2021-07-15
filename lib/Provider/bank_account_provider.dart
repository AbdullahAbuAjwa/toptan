import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/response/bank_account.dart';

class BankAccountProvider with ChangeNotifier {
  List<Account>? _items = [];

  List<Account>? get items {
    return [...?_items];
  }

  Future<void> fetchBankAccounts(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getBankAccounts',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      //  print(response.data);
      BankAccountResponse bankAccountResponse =
          BankAccountResponse.fromJson(response.data);
      _items = bankAccountResponse.accounts;
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }
}
