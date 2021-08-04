import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InvoiceLineCard extends StatefulWidget {
  @override
  _InvoiceLineCardState createState() => _InvoiceLineCardState();
}

class _InvoiceLineCardState extends State<InvoiceLineCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 220.w,
      margin: EdgeInsets.only(top: 15.h),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: const Color(0xff445570),
                    ),
                    children: [
                      TextSpan(
                        text: '2',
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'GB',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: const Color(0xff445570),
                    ),
                    children: [
                      TextSpan(
                        text: '500',
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'DK',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: const Color(0xff445570),
                    ),
                    children: [
                      TextSpan(
                        text: '100',
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'SMS',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              '29\$',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 35.sp,
                color: const Color(0xff08a8ff),
              ),
            ),
            Text(
              'Package Name',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17.sp,
                color: const Color(0xff445570),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
