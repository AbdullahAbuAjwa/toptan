import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toptan/Pages/notification_screen.dart';

PreferredSizeWidget appBarApp(title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontSize: 20.sp),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Color(0xff08A8FF),
  );
}

PreferredSizeWidget appBarAppWithNotification(title, context) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontSize: 20.sp),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Color(0xff08A8FF),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: NotificationScreen()));
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
