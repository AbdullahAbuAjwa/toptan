import 'package:flutter/material.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toptan/Widgets/app_bar.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('reset_password'.tr()),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60.h),
        child: Column(
          children: [
            Text(
              'Toptan',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 72.sp,
                color: const Color(0x99000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 65.h),
            Text(
              'forget_password'.tr(),
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 28.sp,
                color: const Color(0xff323b4a),
                letterSpacing: 0.336,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              'Make amazing and clean iOS 11 \nwireframes for your next app project.',
              textScaleFactor: 1.5.h,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15.sp,
                color: const Color(0xff323b4a),
                //height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            Container(
              margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
              height: 50.h,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0.r)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  suffixIcon: Icon(
                    CustomIcon.ic_security_locked,
                    color: Color(0xff08A8FF),
                    size: 28.sp,
                  ),
                  fillColor: Colors.white,
                  hintText: '********',
                  hintStyle: TextStyle(
                    color: Color(0xff4A494B),
                  ),
                ),
              ),
            ),
            SizedBox(height: 65.h),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  'move_to_login_screen',
                );
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0.r),
                ),
                primary: Colors.white,
                fixedSize: Size(250.w, 55.h),
              ),
              child: Text(
                'reset'.tr(),
                style: TextStyle(
                  color: Color(0xff08A8FF),
                  fontSize: 17.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
