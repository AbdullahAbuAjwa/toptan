import 'package:flutter/material.dart';
import 'package:toptan/Icons/custom_icon_icons.dart';
import 'package:toptan/Pages/SettingScreen.dart';
import 'package:toptan/Pages/about_us_screen.dart';
import 'package:toptan/Pages/contact_us_screen.dart';
import 'package:toptan/Pages/home_screen.dart';
import 'package:toptan/Pages/my_cart_screen.dart';
import 'package:toptan/Pages/order_products_screen.dart';
import 'package:toptan/Pages/order_screen.dart';
import 'package:toptan/Pages/pos_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff08A8FF),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff08A8FF),
                ),
                currentAccountPictureSize: Size(85, 85),
                accountEmail: null,
                accountName: Text(
                  'Pankaj Patel',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 19,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'move_to_edit_profile_screen',
                    );
                  },
                  child: Container(
                    height: 40.0,
                    width: 65.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatar.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
              indent: 50,
              endIndent: 50,
            ),
            DrawerTile(
              title: 'Home',
              icon: Icons.home_outlined,
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomeScreen();
                }));
              },
            ),
            DrawerTile(
              title: 'Notification',
              icon: Icons.notifications_none_outlined,
              onTap: () {
                Navigator.of(context).pushNamed('move_to_notification_screen');
              },
            ),
            DrawerTile(
              title: 'My Cart',
              icon: CustomIcon.ic_ecommerce_cart,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return MyCartScreen();
                    },
                  ),
                );
              },
            ),
            DrawerTile(
              title: 'Chat',
              icon: CustomIcon.ic_contact_chat,
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('move_to_chat_screen');
              },
            ),
            DrawerTile(
              title: 'Order',
              icon: Icons.view_compact,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return OrderScreen();
                    },
                  ),
                );
              },
            ),
            DrawerTile(
              title: 'Order Products',
              icon: Icons.checklist,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return OrderProductsScreen();
                    },
                  ),
                );
              },
            ),
            DrawerTile(
              title: 'Additional Services',
              icon: Icons.monetization_on_outlined,
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('move_to_additional_services_screen');
              },
            ),
            DrawerTile(
              title: 'POS',
              icon: CustomIcon.ic_contact_map_pin,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return POSScreen();
                    },
                  ),
                );
              },
            ),
            DrawerTile(
              title: 'Contact Us',
              icon: Icons.contact_phone,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ContactUsScreen();
                    },
                  ),
                );
              },
            ),
            DrawerTile(
              title: 'About Us',
              icon: Icons.info_outline,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AboutUsScreen();
                    },
                  ),
                );
              },
            ),
            DrawerTile(
              title: 'Setting',
              icon: Icons.settings,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SettingScreen();
                    },
                  ),
                );
              },
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Powered By',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13,
                      color: const Color(0xff08a8ff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                    child: Container(
                      child: Image(
                        height: 100,
                        width: 100,
                        image: AssetImage('assets/images/hexalogo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatefulWidget {
  final title;
  final icon;
  final onTap;

  const DrawerTile({
    this.title,
    this.icon,
    this.onTap,
  });

  @override
  _DrawerTileState createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(widget.icon, color: Colors.white),
      ),
      onTap: widget.onTap,
    );
  }
}
