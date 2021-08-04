import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ButtonSend extends StatelessWidget {
  final onTap;
  final text;
  final buttonColor;
  final textColor;

  ButtonSend({
    required this.onTap,
    required this.text,
    required this.buttonColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0.r),
        ),
        primary: buttonColor,
        fixedSize: Size(250.w, 60.h),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
