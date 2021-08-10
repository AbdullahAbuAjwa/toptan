import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/cart_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/loading_list.dart';
import 'package:toptan/Widgets/my_cart_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartScreen extends StatefulWidget {
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<CartProvider>(context)
        .getMyCart(Localizations.localeOf(context));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xff08A8FF),
        drawer: AppDrawer(),
        appBar: appBarAppWithNotification('my_cart'.tr(), context),
        body: Container(
          height: double.infinity,
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0.r),
              topRight: Radius.circular(16.0.r),
            ),
          ),
          child: ListView(
            children: [
              Provider.of<CartProvider>(context).items!.isEmpty
                  ? loadingCart()
                  : Provider.of<CartProvider>(context).totalAmount == 0 ||
                          Provider.of<CartProvider>(context).totalAmount == null
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30.0.h),
                            child: Text(
                              'cart_empty'.tr(),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              Provider.of<CartProvider>(context).items!.length,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CartCard(Provider.of<CartProvider>(context)
                                .items![index]);
                          },
                        ),
              /*  FutureBuilder(
                future: _future,
                builder: (ctx, AsyncSnapshot snapshot) => snapshot
                            .connectionState ==
                        ConnectionState.waiting
                    ? loadingCart()
                    : Consumer<CartProvider>(
                        builder: (BuildContext context, data, Widget? child) =>
                            data.items!.length == 0
                                ? Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 30.0.h),
                                      child: Text(
                                        'cart_empty'.tr(),
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                :
                            ListView.builder(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.items!.length,
                                    itemBuilder: (ctx, i) {
                                      return CartCard(
                                        cartId: data.items![i].id,
                                        name: data.items![i].productCart!.name,
                                        price: data.items![i].price,
                                        image:
                                            data.items![i].productCart!.image,
                                        quantity: data.items![i].quantity,
                                      );
                                    },
                                  ),
                      ),
              ),*/
              if (Provider.of<CartProvider>(context).totalAmount != 0 &&
                  Provider.of<CartProvider>(context).totalAmount != null)
                Text(
                  'total_amount'.tr(),
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 17.sp,
                    color: const Color(0xff8b98b4),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 10),
              if (Provider.of<CartProvider>(context).totalAmount != 0 &&
                  Provider.of<CartProvider>(context).totalAmount != null)
                Text(
                  '\$${Provider.of<CartProvider>(context).totalAmount.toString()}',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 26.sp,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 30.h),
              if (Provider.of<CartProvider>(context).totalAmount != 0 &&
                  Provider.of<CartProvider>(context).totalAmount != null)
                Padding(
                  padding:
                      EdgeInsets.only(right: 70.0.w, left: 70.w, bottom: 20.h),
                  child: ElevatedButton(
                    onPressed: () async {
                      await Provider.of<CartProvider>(context, listen: false)
                          .checkOut(
                        Localizations.localeOf(context),
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        'move_to_send_request_order_screen',
                        //  ModalRoute.withName('move_to_home_screen')
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0.h),
                      ),
                      primary: Color(0xff08A8FF),
                      fixedSize: Size(100.w, 60.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'make_order'.tr(),
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 16.sp,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                          child: Icon(Icons.arrow_forward_outlined),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
