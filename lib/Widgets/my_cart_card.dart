import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/cart_provider.dart';

import 'package:toptan/model/response/cart.dart';

class CartCard extends StatefulWidget {
  MyCart myCart;

  CartCard(this.myCart); // final cartId, name, price, image;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, _) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Card(
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    widget.myCart.productCart!.image,
                    height: 150.h,
                    width: 150.w,
                    errorBuilder: (_, __, ___) => Image.asset(
                      'assets/images/phone.jpg',
                      height: 150.h,
                      width: 150.w,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.myCart.productCart!.name,
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
                        '\$${widget.myCart.price}',
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
                              // setState(() {
                              //   widget.myCart.quantity++;
                              // });
                              cartProvider.changeQuantity(
                                  Localizations.localeOf(context),
                                  widget.myCart.id,
                                  1);
                            },
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Color(0xff8B98B4),
                              size: 24.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(widget.myCart.quantity.toString()),
                          ),
                          IconButton(
                            onPressed: () {
                              if (widget.myCart.quantity > 1) {
                                // setState(() {
                                //   widget.myCart.quantity--;
                                // });
                                cartProvider.changeQuantity(
                                    Localizations.localeOf(context),
                                    widget.myCart.id,
                                    0);
                              }
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
                  IconButton(
                      onPressed: () {
                        setState(() {
                          cartProvider.deleteProductCart(
                              Localizations.localeOf(context),
                              widget.myCart.id);
                        });
                      },
                      icon: Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.red,
                      ))
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
    });
  }
}
