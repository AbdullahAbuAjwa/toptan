import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicePricesCard extends StatefulWidget {
  final name;
  final price;
  final nameService;
  final details;

  ServicePricesCard({this.name, this.price, this.nameService, this.details});

  @override
  _ServicePricesCardState createState() => _ServicePricesCardState();
}

class _ServicePricesCardState extends State<ServicePricesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 8.h),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 6.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        '${widget.name}',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff08a8ff),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${widget.price}\$',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 21.sp,
                          color: const Color(0xff08a8ff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.nameService,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18.sp,
                  color: const Color(0xff445570),
                ),
              ),
              Text(
                widget.details,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18.sp,
                  color: const Color(0xff445570),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
