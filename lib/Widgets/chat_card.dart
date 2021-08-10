import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toptan/model/response/chat.dart';

class ChatCard extends StatelessWidget {
  Chat? chat;

  ChatCard(this.chat);

  @override
  Widget build(BuildContext context) {
    final bg = chat!.sender == 1 ? Color(0xffF3F4F7) : Color(0xff08A8FF);
    final align =
        chat!.sender == 1 ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final mainAlignment =
        chat!.sender == 1 ? MainAxisAlignment.start : MainAxisAlignment.end;
    final icon = chat!.sender == 1
        ? null
        : chat!.read == 1
            ? Icons.done_all
            : Icons.done;
    final radius = chat!.sender == 1
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
                  chat!.message,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 15.sp,
                    color: chat!.sender == 1 ? Colors.black : Color(0xffffffff),
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
                      '${chat!.date.toString().substring(0, 10)} '
                      '${chat!.time}',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 11.sp,
                        color: chat!.sender == 1
                            ? Colors.black
                            : Color(0xffffffff),
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
