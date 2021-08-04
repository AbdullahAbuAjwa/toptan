import 'package:flutter/material.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsCard extends StatefulWidget {
  final oPrice, sPrice, rPrice;

  const ProductsCard({Key? key, this.oPrice, this.sPrice, this.rPrice})
      : super(key: key);

  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Container(
              height: 100.h,
              child: Image.asset(
                'assets/images/category.png',
                height: 80.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Center(
              child: Text(
                'Name',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 15.sp,
                  color: const Color(0xff08a8ff),
                ),
                children: [
                  TextSpan(
                    text: 'O|',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                  ),
                  TextSpan(
                    text: '\$${widget.oPrice}',
                    style: TextStyle(
                      color: const Color(0xff8b98b4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: const Color(0xfff5f5f5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                child: Icon(
                  CustomIcon.ic_ecommerce_cart,
                  color: Color(0xff08A8FF),
                  size: 20.sp,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 15.sp,
                  color: const Color(0xff08a8ff),
                ),
                children: [
                  TextSpan(
                    text: 'S|',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                  ),
                  TextSpan(
                    text: '\$${widget.sPrice}',
                    style: TextStyle(
                      color: const Color(0xff8b98b4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: const Color(0xfff5f5f5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                child: Icon(
                  CustomIcon.ic_ecommerce_cart,
                  color: Color(0xff08A8FF),
                  size: 20.sp,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 15.sp,
                  color: const Color(0xff08a8ff),
                ),
                children: [
                  TextSpan(
                    text: 'R|',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                  ),
                  TextSpan(
                    text: '\$${widget.rPrice}',
                    style: TextStyle(
                      color: const Color(0xff8b98b4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: const Color(0xfff5f5f5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                child: Icon(
                  CustomIcon.ic_ecommerce_cart,
                  color: Color(0xff08A8FF),
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
