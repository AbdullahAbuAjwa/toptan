import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/notification_provider.dart';
import 'package:toptan/Widgets/notification_card.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('sssssssss: ' + ConnectivityResult.wifi.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('notification'.tr()),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<NotificationProvider>(context, listen: false)
            .fetchNotification(Localizations.localeOf(context)),
        builder: (ctx, AsyncSnapshot snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<NotificationProvider>(
                    builder: (BuildContext context, data, Widget? child) =>
                        ListView.builder(
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
