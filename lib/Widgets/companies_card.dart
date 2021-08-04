import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompaniesCard extends StatefulWidget {
  final image;
  final title;

  const CompaniesCard({Key? key, this.image, this.title}) : super(key: key);

  @override
  _CompaniesCardState createState() => _CompaniesCardState();
}

class _CompaniesCardState extends State<CompaniesCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.0.h),
                child: Image.network(
                  widget.image,
                  height: 80.h,
                  fit: BoxFit.contain,
                  width: 90.w,
                  errorBuilder: (_, __, ___) => Image.asset(
                    'assets/images/applelogo.png',
                    height: 80.h,
                    fit: BoxFit.contain,
                    width: 90.w,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 18.sp,
                  color: const Color(0xfe000000),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
