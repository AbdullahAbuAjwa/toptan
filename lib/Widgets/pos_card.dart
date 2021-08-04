import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class POSCard extends StatefulWidget {
  final image;
  final name;
  final phoneNumber;

  const POSCard({Key? key, this.image, this.name, this.phoneNumber})
      : super(key: key);

  @override
  _POSCARDState createState() => _POSCARDState();
}

class _POSCARDState extends State<POSCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundImage: NetworkImage(
                  widget.image,
                ),
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18.sp,
                  color: const Color(0xff445570),
                ),
              ),
              Text(
                '${widget.phoneNumber}',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  color: const Color(0xff08a8ff),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
