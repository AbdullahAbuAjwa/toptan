import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/cart_provider.dart';
import 'dart:math';

class CartCard extends StatefulWidget {
  final id, name, price, image, onIncreaseTap, onDecreaseTap;
  var quantity;

  CartCard(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.quantity,
      this.onIncreaseTap,
      this.onDecreaseTap});

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          child: Card(
            elevation: 0,
            child: Row(
              children: [
                Image.network(
                  widget.image,
                  height: 150.h,
                  width: 150.w,
                  errorBuilder: (_, __, ___) => Image.asset(
                    'assets/images/product.png',
                    height: 150.h,
                    width: 150.w,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 18.sp,
                        color: const Color(0xfe000000),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      '\$${widget.price}',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 14.sp,
                        color: const Color(0xff8b98b4),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.quantity++;
                            });
                            Provider.of<CartProvider>(context, listen: false)
                                .changeQuantity(Localizations.localeOf(context),
                                    widget.id, 1);
                            // widget.onIncreaseTap;
                          },
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Color(0xff8B98B4),
                            size: 24.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(widget.quantity.toString()),
                        ),
                        IconButton(
                          onPressed: () {
                            if (widget.quantity > 1) {
                              setState(() {
                                widget.quantity--;
                              });
                              Provider.of<CartProvider>(context, listen: false)
                                  .changeQuantity(
                                      Localizations.localeOf(context),
                                      widget.id,
                                      0);
                            }

                            //    widget.onDecreaseTap;
                          },
                          icon: Icon(
                            Icons.remove_circle_outline,
                            color: Color(0xff8B98B4),
                            size: 24.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
