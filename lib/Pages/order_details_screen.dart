import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/orders_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toptan/Widgets/loading_list.dart';
import 'package:toptan/Widgets/order_details_card.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  OrderProvider? orderProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    orderProvider = Provider.of<OrderProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp(arguments['name'] ?? 'order_balance'.tr()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
            future: Provider.of<OrderProvider>(context, listen: false)
                .getOrderDetails(
                    Localizations.localeOf(context), arguments['id']),
            builder: (ctx, AsyncSnapshot snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? loadingOrders()
                    : Consumer<OrderProvider>(
                        builder: (BuildContext context, data, Widget? child) {
                          if (arguments['type'] == 1) {
                            return OrderDetailsCard(
                              mobileNumber: orderProvider!
                                  .orderDetailsResponse!.orderDetails!.mobile,
                              price: orderProvider!
                                  .orderDetailsResponse!.orderDetails!.amount,
                              name: orderProvider!.orderDetailsResponse!
                                  .orderDetails!.service!.name,
                              details: orderProvider!.orderDetailsResponse!
                                  .orderDetails!.service!.details,
                              photoId: orderProvider!
                                  .orderDetailsResponse!.orderDetails!.photoId,
                              photoQrCode: orderProvider!.orderDetailsResponse!
                                  .orderDetails!.photoSimCard,
                              comment: orderProvider!
                                  .orderDetailsResponse!.orderDetails!.comment,
                            );
                          } else if (arguments['type'] == 2) {
                            return OrdersBalanceDetailsCard(
                              price: orderProvider!
                                  .orderDetailsResponse!.orderDetails!.amount,
                              comment: orderProvider!
                                  .orderDetailsResponse!.orderDetails!.comment,
                              imageBalance: orderProvider!.orderDetailsResponse!
                                  .orderDetails!.imageBalance,
                            );
                          }
                          return Container();
                        },
                      ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0.h),
            child: ButtonSend(
              buttonColor: Colors.white,
              onTap: () {},
              textColor: Color(0xff08A8FF),
              text: 'send'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
