import 'package:flutter/material.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:easy_localization/easy_localization.dart';

class AdditionalServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xff08A8FF),
        drawer: AppDrawer(),
        appBar: appBarAppWithNotification('additional_services'.tr(), context),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('move_to_prices_screen');
                    },
                    child: ListTile(
                      title: Text('prices'.tr()),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Color(0xff08A8FF),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('move_to_service_prices_screen');
                    },
                    child: ListTile(
                      title: Text('service_prices').tr(),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Color(0xff08A8FF),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('move_to_bank_accounts_screen');
                    },
                    child: ListTile(
                      title: Text('bank_accounts').tr(),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Color(0xff08A8FF),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('move_to_order_balance_screen');
                    },
                    child: ListTile(
                      title: Text('order_balance'.tr()),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Color(0xff08A8FF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
