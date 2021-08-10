import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/model/response/order_products.dart';

class OrderProductCard extends StatefulWidget {
  OrderProducts? orderProducts;

  OrderProductCard(this.orderProducts);

  @override
  _OrderProductCardState createState() => _OrderProductCardState();
}

class _OrderProductCardState extends State<OrderProductCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: ExpansionTile(
          title: Text(
            '\$${widget.orderProducts!.amount}',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 17.sp,
              color: const Color(0xff323b4a),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              widget.orderProducts!.createdAt.toString().substring(0, 10),
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14.sp,
                color: const Color(0xff445570),
              ),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 25.h,
                width: 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: widget.orderProducts!.status == 0
                      ? Color(0xfff9a22a)
                      : widget.orderProducts!.status == 1
                          ? Color(0xffF92A30)
                          : widget.orderProducts!.status == 2
                              ? Colors.blue
                              : Color(0xff04A35A),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x15000000),
                      offset: Offset(0, 1),
                      blurRadius: 3.r,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.orderProducts!.status == 0
                        ? 'waiting'.tr()
                        : widget.orderProducts!.status == 1
                            ? 'processing'.tr()
                            : widget.orderProducts!.status == 2
                                ? 'activated'.tr()
                                : 'canceled'.tr(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15.sp,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Icon(Icons.arrow_downward_rounded)
            ],
          ),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'product'.tr(),
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'quantity'.tr(),
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'price'.tr(),
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: widget.orderProducts!.products!
                  .map(
                    (element) => Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
                      child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text(
                                element.product!.name.toString(),
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.red),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${element.quantity}',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.red),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${element.price}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
