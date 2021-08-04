import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('send_request'.tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 45.0.h, horizontal: 45.w),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/send.png',
                height: 250.h,
                width: 200.w,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Text(
                  'request_sent_approval'.tr(),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22.sp,
                    color: const Color(0xff323b4a),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    'move_to_home_screen',
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0.r),
                  ),
                  primary: Color(0xff08A8FF),
                  fixedSize: Size(250.w, 55.h),
                ),
                child: Text(
                  'go_to_home'.tr(),
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16.sp,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
