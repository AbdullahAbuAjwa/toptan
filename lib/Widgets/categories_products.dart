import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoriesProducts extends StatefulWidget {
  final titleCategory;

  const CategoriesProducts(this.titleCategory);

  @override
  _CategoriesProductsState createState() => _CategoriesProductsState();
}

class _CategoriesProductsState extends State<CategoriesProducts> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: const Color(0xffffffff),
        ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            child: Text(
              widget.titleCategory,
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 14.sp,
                color: const Color(0xff000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
