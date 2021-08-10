import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';

class OrderDetailsCard extends StatefulWidget {
  final mobileNumber, photoId, photoQrCode, details, name, price, comment;

  OrderDetailsCard({
    this.mobileNumber,
    this.photoId,
    this.photoQrCode,
    this.details,
    this.name,
    this.price,
    this.comment,
  });

  @override
  _OrderDetailsCardState createState() => _OrderDetailsCardState();
}

class _OrderDetailsCardState extends State<OrderDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'mobile_no'.tr(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.sp,
                      color: const Color(0xff323b4a),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.mobileNumber == null
                        ? 'no_number'.tr()
                        : widget.mobileNumber,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff4a494b),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'photo_id'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        color: const Color(0xff323b4a),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Icon(
                        CustomIcon.ic_devices_camera,
                        color: Color(0xff08A8FF),
                      ),
                      title: Text(
                        'edit'.tr(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12.sp,
                          color: const Color(0xff8d8d8d),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.photoId == null ? 'no_image'.tr() : widget.photoId,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        color: const Color(0xff323b4a),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'photo_QR_code'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        color: const Color(0xff323b4a),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Icon(
                        CustomIcon.ic_devices_camera,
                        color: Color(0xff08A8FF),
                      ),
                      title: Text(
                        'edit'.tr(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12.sp,
                          color: const Color(0xff8d8d8d),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.photoQrCode == null
                          ? 'no_image'.tr()
                          : widget.photoQrCode,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        color: const Color(0xff323b4a),
                        letterSpacing: 0.168,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              if (widget.details != null)
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        color: const Color(0xff445570),
                      ),
                      children: [
                        TextSpan(
                          text: 'Details: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: widget.details,
                        ),
                      ]),
                ),
              SizedBox(height: 15.h),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff445570),
                      letterSpacing: 0.42,
                      height: 1.4285714285714286,
                    ),
                    children: [
                      TextSpan(
                        text: 'comm'.tr(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: widget.comment == null
                            ? 'No comment'
                            : widget.comment,
                      ),
                    ]),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name == null ? 'order_balance'.tr() : widget.name,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 17.sp,
                      color: const Color(0xff445570),
                      letterSpacing: 0.51,
                      fontWeight: FontWeight.w500,
                      height: 1.3529411764705883,
                    ),
                  ),
                  Text(
                    '${widget.price}\$',
                    textScaleFactor: 1.sp,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25.sp,
                      color: const Color(0xff08a8ff),
                      letterSpacing: 0.75,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrdersBalanceDetailsCard extends StatefulWidget {
  final price, comment, imageBalance;

  OrdersBalanceDetailsCard({this.price, this.comment, this.imageBalance});

  @override
  _OrdersBalanceDetailsCardState createState() =>
      _OrdersBalanceDetailsCardState();
}

class _OrdersBalanceDetailsCardState extends State<OrdersBalanceDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'image_balance'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        color: const Color(0xff323b4a),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Icon(
                        CustomIcon.ic_devices_camera,
                        color: Color(0xff08A8FF),
                      ),
                      title: Text(
                        'edit'.tr(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12.sp,
                          color: const Color(0xff8d8d8d),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.imageBalance == null
                          ? 'no_image'.tr()
                          : widget.imageBalance,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        color: const Color(0xff323b4a),
                        letterSpacing: 0.168,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff445570),
                      letterSpacing: 0.42,
                      height: 1.4285714285714286,
                    ),
                    children: [
                      TextSpan(
                        text: 'comm'.tr(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: widget.comment == null
                            ? 'No comment'
                            : widget.comment,
                      ),
                    ]),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'order_balance'.tr(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 17.sp,
                      color: const Color(0xff445570),
                      letterSpacing: 0.51,
                      fontWeight: FontWeight.w500,
                      height: 1.3529411764705883,
                    ),
                  ),
                  Text(
                    '${widget.price}\$',
                    textScaleFactor: 1.sp,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25.sp,
                      color: const Color(0xff08a8ff),
                      letterSpacing: 0.75,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
