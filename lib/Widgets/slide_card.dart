import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideCard extends StatefulWidget {
  final title, image, details;

  SlideCard({this.title, this.image, this.details});

  @override
  _SlideCardState createState() => _SlideCardState();
}

class _SlideCardState extends State<SlideCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 90.h),
      child: Container(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                widget.image.toString(),
                width: 300.h,
                height: 230.w,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Text(
                widget.title.toString(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 28.sp,
                  color: const Color(0xff323b4a),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Text(
                widget.details.toString(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  color: const Color(0xff323b4a),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
