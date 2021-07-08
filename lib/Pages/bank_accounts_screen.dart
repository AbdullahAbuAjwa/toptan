import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class BankAccountsScreen extends StatefulWidget {
  @override
  _BankAccountsScreenState createState() => _BankAccountsScreenState();
}

class _BankAccountsScreenState extends State<BankAccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('bank_accounts').tr(),
        centerTitle: true,
      ),
    );
  }
}
