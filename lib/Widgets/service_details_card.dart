import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsCard extends StatefulWidget {
  final id;
  final name;
  final details;
  final price;
  late bool selected;
  final Function onTap;

  ServiceDetailsCard({
    this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.selected,
    required this.onTap,
  });

  @override
  _ServiceDetailsCardState createState() => _ServiceDetailsCardState();
}

class _ServiceDetailsCardState extends State<ServiceDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: GestureDetector(
        onTap: () {
          setState(() {});
          // intSelected = widget.id;
          widget.selected = !widget.selected;
          // print(intSelected);
          widget.onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.price.toString()}\$',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 35.sp,
                    color: const Color(0xff08a8ff),
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.name}: ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff445570),
                            ),
                          ),
                          Text(
                            widget.details,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 17.sp,
                              color: const Color(0xff445570),
                            ),
                          ),
                        ],
                      ),
                      widget.selected
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black, width: 1.5.w),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.r)),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 40.sp,
                                color: Color(0xff08a8ff),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
