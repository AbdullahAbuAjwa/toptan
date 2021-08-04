import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/bank_account_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/banck_account%20card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankAccountsScreen extends StatefulWidget {
  @override
  _BankAccountsScreenState createState() => _BankAccountsScreenState();
}

class _BankAccountsScreenState extends State<BankAccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('bank_accounts'.tr()),
      body: FutureBuilder(
        future: Provider.of<BankAccountProvider>(context, listen: false)
            .fetchBankAccounts(Localizations.localeOf(context)),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: SpinKitDualRing(color: Colors.white),
                  )
                : Consumer<BankAccountProvider>(
                    builder: (BuildContext context, data, Widget? child) =>
                        GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.w,
                        childAspectRatio: 0.9.h,
                        mainAxisSpacing: 8.h,
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
