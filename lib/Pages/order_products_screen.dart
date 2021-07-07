import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/order_product_card.dart';
import 'package:toptan/Widgets/search.dart';

enum select { selectAll, waiting, accept, reject }

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
        title: Text('Order Products'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff08A8FF),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
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
                                  title: Text('Select All'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  value = select.waiting;
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  title: Text('Waiting'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  value = select.accept;
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  title: Text('Accept'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  value = select.reject;
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  title: Text('Reject'),
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
                                ? 'Select All'
                                : value == select.waiting
                                    ? 'Waiting'
                                    : value == select.waiting
                                        ? 'Accept'
                                        : 'Reject',
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
                OrderCard(name: 'Name', date: '1/10/2021', status: 'Accept'),
                OrderCard(name: 'Name', date: '1/10/2021', status: 'Reject'),
                OrderCard(name: 'Name', date: '3/10/2021', status: 'Waiting'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
