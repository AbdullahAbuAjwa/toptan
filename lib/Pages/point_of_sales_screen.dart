import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/pos_provider.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/pos_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointOfSalesScreen extends StatefulWidget {
  @override
  _PointOfSalesScreenState createState() => _PointOfSalesScreenState();
}

class _PointOfSalesScreenState extends State<PointOfSalesScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

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
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: SpinKitDualRing(
                        color: Colors.white,
                      ),
                    )
                  : Consumer<PointOfSaleProvider>(
                      builder: (BuildContext context, data, Widget? child) =>
                          GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.w,
                                childAspectRatio: 0.9.h,
                                mainAxisSpacing: 8.h,
                              ),
                              itemCount: data.items!.length,
                              itemBuilder: (ctx, index) => PointOfSaleCard(
                                    name: data.items![index].name,
                                    image: data.items![index].profileImage,
                                    phoneNumber: data.items![index].mobile,
                                  ))),
        ),
      ),
    );
  }

  appBar() {
    return AppBar(
      backgroundColor: Color(0xff08A8FF),
      elevation: 0,
      title: Text(
        'pos'.tr(),
        style: TextStyle(fontSize: 20.sp),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 8.0.w),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('move_to_create_pos_screen');
            },
            child: Icon(
              Icons.add,
              size: 28.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 12.0.w),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('move_to_notification_screen');
            },
            child: Icon(
              Icons.notifications_none_outlined,
              size: 28.sp,
            ),
          ),
        ),
      ],
    );
  }
}
