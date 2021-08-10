import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toptan/model/response/chat.dart';

class ChatImageCard extends StatelessWidget {
  Chat? chat;


  ChatImageCard(this.chat); // ChatImageCard(


  @override
  Widget build(BuildContext context) {
    final align =
        chat!.sender == 1 ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final bg = chat!.sender == 1 ? Color(0xffF3F4F7) : Color(0xff08A8FF);
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
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          );
    final radiusImage = chat!.sender == 1
        ? BorderRadius.only(
            topRight: Radius.circular(20.r),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(20.r),
          );
    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.38,
          width: MediaQuery.of(context).size.width / 2,
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          padding: EdgeInsets.only(bottom: 5.0.h),
          decoration: BoxDecoration(
            borderRadius: radius,
            color: bg,
          ),
          child: Column(
            crossAxisAlignment: align,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: radiusImage,
                  child: Image.network(
                    chat!.message,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.34,
                    errorBuilder: (context, error, track) => Container(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4.h, right: 8.w, left: 8.w),
                child: Row(
                  mainAxisAlignment: mainAlignment,
                  children: <Widget>[
                    Text(
                      '${chat!.date} ${chat!.time}',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 11,
                        color: chat!.sender == 1 ? Colors.black : Color(0xffffffff),
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
        ),
      ],
    );
  }
}
