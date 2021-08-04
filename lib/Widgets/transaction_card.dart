import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionCard extends StatelessWidget {
  final name, date, previousPrice, price, isPositive;

  const TransactionCard({
    Key? key,
    this.name,
    this.date,
    this.previousPrice,
    this.price,
    this.isPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18.sp,
                  color: const Color(0xff616161),
                ),
                textAlign: TextAlign.left,
              ),
              // Adobe XD layer: 'New Text Document' (text)
              Text(
                'Previous'.tr() + ' \$$previousPrice',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14.sp,
                  color: const Color(0xff536178),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14.sp,
                  color: const Color(0xffafafaf),
                ),
              ),
              // Adobe XD layer: 'New Text Document' (text)
              Text(
                isPositive ? '+\$$price' : '-\$$price',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  color: isPositive ? Color(0xff009700) : Color(0xffFF6969),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
