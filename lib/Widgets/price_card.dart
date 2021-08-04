import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceCard extends StatefulWidget {
  final price;
  final title;

  const PriceCard({Key? key, this.price, this.title}) : super(key: key);

  @override
  _PriceCardState createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${widget.price}\$',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 23.sp,
                  color: const Color(0xff08a8ff),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18.sp,
                  color: const Color(0xff445570),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
