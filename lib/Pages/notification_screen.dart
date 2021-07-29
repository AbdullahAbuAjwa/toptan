import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/notification_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/loading_list.dart';
import 'package:toptan/Widgets/notification_card.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('notification'.tr()),
      body: FutureBuilder(
        future: Provider.of<NotificationProvider>(context, listen: false)
            .fetchNotification(Localizations.localeOf(context)),
        builder: (ctx, AsyncSnapshot snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? loadingNotifications()
            // Center(
            //         child: SpinKitDualRing(
            //           color: Colors.white,
            //         ),
            //       )
            : Consumer<NotificationProvider>(
                builder: (BuildContext context, data, Widget? child) =>
                    data.items!.length == 0
                        ? Center(
                            child: Text(
                              'no_notification'.tr(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : ListView.builder(
                            physics: ScrollPhysics(),
                            itemCount: data.items!.length,
                            itemBuilder: (ctx, i) => NotificationCard(
                              title: data.items![i].title,
                              message: data.items![i].message,
                              createdAt: data.items![i].createdAt.toString(),
                            ),
                          ),
              ),
      ),
    );
  }
}
