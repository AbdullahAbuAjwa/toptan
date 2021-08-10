import 'package:flutter/material.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsCard extends StatefulWidget {
  final oPrice, sPrice, rPrice, image, name, id;
  final onOPriceTap, onSPriceTap, onRPriceTap;

  ProductsCard(
      {this.oPrice,
      this.sPrice,
      this.rPrice,
      this.image,
      this.name,
      this.id,
      this.onOPriceTap,
      this.onSPriceTap,
      this.onRPriceTap});

  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  @override

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
              child: Image.network(
                widget.image,
                height: 80.h,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Image.asset(
                  'assets/images/category.png',
                  height: 80.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Center(
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ),
          prices('O| ', widget.oPrice, widget.onOPriceTap),
          prices('S| ', widget.sPrice, widget.onSPriceTap),
          prices('R| ', widget.rPrice, widget.onRPriceTap),
        ],
      ),
    );
  }

  Widget prices(typePrice, price, onTap) {
    return ListTile(
      title: Text.rich(
        TextSpan(
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 15.sp,
            color: const Color(0xff08a8ff),
          ),
          children: [
            TextSpan(
              text: typePrice,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
            TextSpan(
              text: '\$$price',
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
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              CustomIcon.ic_ecommerce_cart,
              color: Color(0xff08A8FF),
              size: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
