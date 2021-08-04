import 'package:flutter/material.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/my_cart_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartScreen extends StatefulWidget {
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
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
        appBar: appBarAppWithNotification('my_cart'.tr(), context),
        body: Container(
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0.r),
              topRight: Radius.circular(16.0.r),
            ),
          ),
          child: ListView(
            children: [
              CartCard(),
              CartCard(),
              Text(
                'total_amount'.tr(),
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 17.sp,
                  color: const Color(0xff8b98b4),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                '\$1700.00',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 26.sp,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.0.w),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0.h),
                    ),
                    primary: Color(0xff08A8FF),
                    fixedSize: Size(100.w, 60.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'make_order'.tr(),
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 16.sp,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Icon(Icons.arrow_forward_outlined),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
