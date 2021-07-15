import 'package:flutter/material.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/my_cart_card.dart';
import 'package:easy_localization/easy_localization.dart';

class MyCartScreen extends StatefulWidget {
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
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
        appBar: AppBar(
          title: Text('my_cart'.tr()),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xff08A8FF),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 12),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('move_to_notification_screen');
                },
                child: Icon(Icons.notifications_none_outlined),
              ),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: ListView(
            children: [
              CartCard(),
              CartCard(),
              Text(
                'total_amount'.tr(),
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 17,
                  color: const Color(0xff8b98b4),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                '\$1700.00',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 26,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Color(0xff08A8FF),
                    fixedSize: Size(100, 60),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'make_order'.tr(),
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
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
