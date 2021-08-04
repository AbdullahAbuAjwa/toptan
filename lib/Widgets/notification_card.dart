import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  // Notifications? notifications;
  //
  // NotificationCard({this.notifications});
  String? title;
  String? message;
  String? createdAt;

  NotificationCard({this.title, this.message, this.createdAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 16.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x15000000),
            offset: Offset(0, 1),
            blurRadius: 3.r,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4a494b),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.h),
                    child: Text(
                      message!,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        color: const Color(0xff4a494b),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/mobile.png',
                        height: 120.h,
                        width: 120.w,
                      ),
                      Text(
                        createdAt!,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14.sp,
                          color: const Color(0xff323b4a),
                          letterSpacing: 0.4,
                          height: 1.5,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
