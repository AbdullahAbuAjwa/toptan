import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/pos_provider.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/pos_card.dart';
import 'package:easy_localization/easy_localization.dart';

class POSScreen extends StatefulWidget {
  @override
  _POSScreenState createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
        return false;
      },
      child: Scaffold(
        drawer: AppDrawer(),
        backgroundColor: Color(0xff08A8FF),
        appBar: appBar(),
        body: FutureBuilder(
          future: Provider.of<PointOfSaleProvider>(context, listen: false)
              .fetchPos(Localizations.localeOf(context)),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<PointOfSaleProvider>(
                  builder: (BuildContext context, data, Widget? child) =>
                      GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.9,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: data.items!.length,
                          itemBuilder: (ctx, index) => POSCard(
                                name: data.items![index].name,
                                image: data.items![index].profileImage,
                                phoneNumber: data.items![index].mobile,
                              ))
                  /*    .builder(
                        physics: ScrollPhysics(),
                        itemCount: data.items!.length,
                        itemBuilder: (ctx, i) => FAQCard(
                          question: data.items![i].question,
                          answer: data.items![i].answer,
                        ),
                      ),*/
                  ),
        ),
        /* body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16),
          physics: ScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9,
          mainAxisSpacing: 16,
          children: [
            POSCard(
              image: 'assets/images/avatar.png',
              name: 'POS Name',
              price: '32',
            ),
          ],
        ),*/
      ),
    );
  }

  appBar() {
    return AppBar(
      backgroundColor: Color(0xff08A8FF),
      elevation: 0,
      title: Text('pos'.tr()),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('move_to_create_pos_screen');
            },
            child: Icon(Icons.add),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('move_to_notification_screen');
            },
            child: Icon(Icons.notifications_none_outlined),
          ),
        ),
      ],
    );
  }
}
