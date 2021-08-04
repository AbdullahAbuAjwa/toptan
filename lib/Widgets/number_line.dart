import 'package:flutter/material.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberLines extends StatefulWidget {
  final onTap;
  final number;

  NumberLines({required this.onTap, required this.number});

  @override
  _NumberLinesState createState() => _NumberLinesState();
}

class _NumberLinesState extends State<NumberLines> {
  number? valueNumber;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.number,
              style: TextStyle(fontSize: 18.sp, color: Color(0xff323B4A)),
            ),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Color(0xff08A8FF),
              size: 30.sp,
            )
          ],
        ),
      ),
    );
  }
}
