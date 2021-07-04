import 'package:flutter/material.dart';
import 'package:toptan/Pages/home_screen.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/order_product_card.dart';
import 'package:toptan/Widgets/search.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _value;

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //   onWillPop: () async {
    //     return false;
    //   },
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Order'),
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
              children: [
                Expanded(
                  flex: 2,
                  child: Search(),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Text('Select'),
                          itemHeight: 50,
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Color(0xff08A8FF),
                            size: 30,
                          ),
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text('Select All'),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text('Waiting'),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text('Accept'),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text('Reject'),
                              value: 4,
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
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
