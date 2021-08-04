import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(
          'move_to_send_request_screen',
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
        'send'.tr(),
        style: TextStyle(
          color: Color(0xff08A8FF),
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
