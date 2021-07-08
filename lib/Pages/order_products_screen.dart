import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/order_product_card.dart';
import 'package:toptan/Widgets/search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Helper/enum.dart';

class OrderProductsScreen extends StatefulWidget {
  @override
  _OrderProductsScreenState createState() => _OrderProductsScreenState();
}

class _OrderProductsScreenState extends State<OrderProductsScreen> {
  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('order_products'.tr()),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff08A8FF),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0,left: 12),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('move_to_notification_screen');
              },
              child: Icon(Icons.notifications_none_outlined),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Search()),
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
                      height: 50,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(12.0),
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
                                fontSize: 18, color: Color(0xff323B4A)),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Color(0xff08A8FF),
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                OrderCard(name: 'Name', date: '1/10/2021', status: 'accept'.tr()),
                OrderCard(name: 'Name', date: '1/10/2021', status: 'reject'.tr()),
                OrderCard(name: 'Name', date: '3/10/2021', status: 'waiting'.tr()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
