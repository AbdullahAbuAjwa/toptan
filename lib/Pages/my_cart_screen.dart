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
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context)
        .getMyCart(Localizations.localeOf(context));
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xff08A8FF),
        drawer: AppDrawer(),
        appBar: appBarAppWithNotification('my_cart'.tr(), context),
        body: Consumer<CartProvider>(builder: (context, provider, _) {
          return Container(
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
                provider.items!.isEmpty
                    ? loadingCart()
                    : ListView.builder(
                        itemCount: provider.items!.length,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CartCard(provider.items![index]);
                        },
                      ),
                if (provider.totalAmount != 0 && provider.totalAmount != null)
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
                if (provider.totalAmount != 0 && provider.totalAmount != null)
                  Text(
                    '\$${provider.totalAmount.toString()}',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 26.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 30.h),
                if (provider.totalAmount != 0 && provider.totalAmount != null)
                  Padding(
                    padding: EdgeInsets.only(
                        right: 70.0.w, left: 70.w, bottom: 20.h),
                    child: ElevatedButton(
                      onPressed: () async {
                        await provider.checkOut(
                          Localizations.localeOf(context),
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          'move_to_send_request_order_screen',
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
          );
        }),
      ),
    );
  }
}
