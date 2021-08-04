import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
