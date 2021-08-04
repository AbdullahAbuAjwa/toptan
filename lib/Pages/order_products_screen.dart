import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/order_product_card.dart';
import 'package:toptan/Widgets/search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderProductsScreen extends StatefulWidget {
  @override
  _OrderProductsScreenState createState() => _OrderProductsScreenState();
}

class _OrderProductsScreenState extends State<OrderProductsScreen> {
  var value;

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Search(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
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
                                    value = select.selectAll;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Text('select_all'.tr()),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    value = select.waiting;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Text('waiting'.tr()),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    value = select.accept;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Text('accept'.tr()),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    value = select.reject;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Text('reject'.tr()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
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
                              value == select.selectAll
                                  ? 'select_all'.tr()
                                  : value == select.waiting
                                      ? 'waiting'.tr()
                                      : value == select.waiting
                                          ? 'accept'.tr()
                                          : 'reject'.tr(),
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
                ],
              ),
              SizedBox(height: 30.h),
              ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  OrderCard(
                      name: 'Name', date: '1/10/2021', status: 'accept'.tr()),
                  OrderCard(
                      name: 'Name', date: '1/10/2021', status: 'reject'.tr()),
                  OrderCard(
                      name: 'Name', date: '3/10/2021', status: 'waiting'.tr()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
