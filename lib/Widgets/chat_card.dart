import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCard extends StatelessWidget {
  final userId, message, sender, read, type, date, time;

  ChatCard(
      {this.userId,
      required this.message,
      required this.sender,
      this.read,
      this.type,
      required this.date,
      required this.time});

  @override
  Widget build(BuildContext context) {
    final bg = sender == 1 ? Color(0xffF3F4F7) : Color(0xff08A8FF);
    final align =
        sender == 1 ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final mainAlignment =
        sender == 1 ? MainAxisAlignment.start : MainAxisAlignment.end;
    final icon = sender == 1
        ? null
        : read == 1
            ? Icons.done_all
            : Icons.done;
    final radius = sender == 1
        ? BorderRadius.only(
            topRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(20.0.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 0.5.r,
                  spreadRadius: 1.0.r,
                  color: Colors.black.withOpacity(0.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Column(
            crossAxisAlignment: align,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5.0.w),
                // : EdgeInsets.only(left: 10.0),
                child: Text(
                  message,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 15.sp,
                    color: sender == 1 ? Colors.black : Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    //height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Row(
                  mainAxisAlignment: mainAlignment,
                  children: <Widget>[
                    Text(
                      date + ' ' + time,
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 11.sp,
                        color: sender == 1 ? Colors.black : Color(0xffffffff),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Icon(
                      icon,
                      size: 12.sp,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
