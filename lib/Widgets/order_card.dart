import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatefulWidget {
  final id;
  final name;
  final createdAt;
  final status;
  final typeOrder;
  final onTap;

  OrderCard({this.id, this.name, this.createdAt, this.status, this.typeOrder,this.onTap});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Card(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: ListTile(
            title: Text(
              widget.name == null ? 'order_balance'.tr() : widget.name,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17.sp,
                color: const Color(0xff323b4a),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                widget.createdAt,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14.sp,
                  color: const Color(0xff445570),
                ),
              ),
            ),
            trailing: Container(
              margin: EdgeInsets.only(top: 25.h),
              height: 25.h,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: widget.status == 0
                    ? Color(0xfff9a22a)
                    : widget.status == 1
                        ? Color(0xffF92A30)
                        : widget.status == 2
                            ? Colors.blue
                            : Color(0xff04A35A),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x15000000),
                    offset: Offset(0, 1),
                    blurRadius: 3.r,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  widget.status == 0
                      ? 'waiting'.tr()
                      : widget.status == 1
                          ? 'processing'.tr()
                          : widget.status == 2
                              ? 'activated'.tr()
                              : 'canceled'.tr(),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15.sp,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
