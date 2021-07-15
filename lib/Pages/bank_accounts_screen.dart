import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/bank_account_provider.dart';
import 'package:toptan/Widgets/banck_account%20card.dart';

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
      body: FutureBuilder(
        future: Provider.of<BankAccountProvider>(context, listen: false)
            .fetchBankAccounts(Localizations.localeOf(context)),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<BankAccountProvider>(
                    builder: (BuildContext context, data, Widget? child) =>
                        GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: data.items!.length,
                      itemBuilder: (ctx, i) => BankAccountCard(
                        numAccount: data.items![i].numAccount,
                        nameBank: data.items![i].nameBank,
                        nameAccount: data.items![i].nameAccount,
                      ),
                    ),
                  ),
      ),
    );
  }
}
