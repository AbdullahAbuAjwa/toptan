import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCard extends StatefulWidget {
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int value = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      child: Card(
        elevation: 0,
        child: Row(
          children: [
            Image.asset(
              'assets/images/product.png',
              height: 150.h,
              width: 150.w,
            ),
            Column(
              children: [
                Text(
                  'Product Name',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 18.sp,
                    color: const Color(0xfe000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 12.h),
                Text(
                  '\$1700',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                    color: const Color(0xff8b98b4),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        value++;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Color(0xff8B98B4),
                        size: 24.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(value.toString()),
                    ),
                    IconButton(
                      onPressed: () {
                        if (value > 0) {
                          value--;
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: Color(0xff8B98B4),
                        size: 24.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
