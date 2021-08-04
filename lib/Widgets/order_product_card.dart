import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatefulWidget {
  final name;
  final date;
  final status;

  const OrderCard({Key? key, this.name, this.date, this.status})
      : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('move_to_service_name_screen');
      },
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
              widget.name,
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
                widget.date,
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
                color: widget.status == 'waiting'.tr()
                    ? Color(0xfff9a22a)
                    : widget.status == 'reject'.tr()
                        ? Color(0xffF92A30)
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
                  widget.status,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: const Color(0xffffffff),
                    letterSpacing: 0.18,
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
