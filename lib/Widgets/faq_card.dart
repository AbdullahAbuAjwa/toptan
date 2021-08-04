import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAQCard extends StatelessWidget {
  final question;
  final answer;

  FAQCard({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
          child: ExpansionTile(
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xff08A8FF),
              size: 26.sp,
            ),
            title: Text(
              question!,
              style: TextStyle(fontSize: 18.sp),
            ),
            children: <Widget>[
              Align(
                alignment:
                    Localizations.localeOf(context).languageCode.toString() ==
                            'ar'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                  child: Text(
                    answer!,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.sp,
                      color: const Color(0xff323b4a),
                      //    height: 1.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
