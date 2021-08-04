import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinesList extends StatefulWidget {
  final onTap;
  final line;

  LinesList({required this.onTap, required this.line});

  @override
  _LinesListState createState() => _LinesListState();
}

class _LinesListState extends State<LinesList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.line ?? 'choose_line'.tr(),
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
