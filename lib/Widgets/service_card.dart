import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCard extends StatefulWidget {
  final image;
  final name;
  final onPress;

  const ServiceCard({Key? key, this.image, this.name, this.onPress})
      : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Image.network(
                    widget.image,
                    height: 80.h,
                    fit: BoxFit.contain,
                    width: 90.w,
                    errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) =>
                        Image.asset(
                      'assets/images/paysell.png',
                      height: 90.h,
                      fit: BoxFit.contain,
                      width: 90.w,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  widget.name,
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
      ),
    );
  }
}
