import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/orders_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/loading_list.dart';
import 'package:toptan/Widgets/order_product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderProductsScreen extends StatefulWidget {
  @override
  _OrderProductsScreenState createState() => _OrderProductsScreenState();
}

class _OrderProductsScreenState extends State<OrderProductsScreen> {
  var value = 4;

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
        appBar: appBarAppWithNotification('order_products'.tr(), context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: InkWell(
                  onTap: () {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                value = 4;
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                title: Text('select_all').tr(),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                value = 0;
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                title: Text('waiting'.tr()),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                value = 1;
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                title: Text('processing'.tr()),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                value = 2;
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                title: Text('activated'.tr()),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                value = 3;
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                title: Text('canceled'.tr()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    //  height: 50.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0.r),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.0.w, vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          value == 0
                              ? 'waiting'.tr()
                              : value == 1
                                  ? 'processing'.tr()
                                  : value == 2
                                      ? 'activated'.tr()
                                      : value == 3
                                          ? 'canceled'.tr()
                                          : 'select_all'.tr(),
                          style: TextStyle(
                              fontSize: 18.sp, color: Color(0xff323B4A)),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Color(0xff08A8FF),
                          size: 30.sp,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              FutureBuilder(
                future: Provider.of<OrderProvider>(context, listen: false)
                    .getOrdersProduct(Localizations.localeOf(context), value),
                builder: (ctx, AsyncSnapshot snapshot) => snapshot
                            .connectionState ==
                        ConnectionState.waiting
                    ? loadingOrders()
                    : Consumer<OrderProvider>(
                        builder: (BuildContext context, data, Widget? child) =>
                            data.orderProductItems!.length == 0
                                ? Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.h),
                                      child: Text(
                                        'no_orders'.tr(),
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.orderProductItems!.length,
                                    itemBuilder: (ctx, i) {
                                      return OrderProductCard(
                                          data.orderProductItems![i]);
                                    },
                                  ),
                      ),
              ),
              /* ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  OrderProductCard(
                      name: 'Name',
                      createdAt: '1/10/2021',
                      status: 'accept'.tr()),
                  OrderProductCard(
                      name: 'Name',
                      createdAt: '1/10/2021',
                      status: 'reject'.tr()),
                  OrderProductCard(
                      name: 'Name',
                      createdAt: '3/10/2021',
                      status: 'waiting'.tr()),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
