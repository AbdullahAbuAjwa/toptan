import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Pages/SettingScreen.dart';
import 'package:toptan/Pages/about_us_screen.dart';
import 'package:toptan/Pages/contact_us_screen.dart';
import 'package:toptan/Pages/home_screen.dart';
import 'package:toptan/Pages/my_cart_screen.dart';
import 'package:toptan/Pages/order_products_screen.dart';
import 'package:toptan/Pages/order_screen.dart';
import 'package:toptan/Pages/point_of_sales_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    AppShared.currentUser =
        AppShared.sharedPreferencesController!.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: Color(0xff08A8FF),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff08A8FF),
                ),
                currentAccountPictureSize: Size(80.w, 80.h),
                accountEmail: null,
                accountName: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    AppShared.currentUser!.user.name,
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 19.sp,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'move_to_edit_profile_screen',
                    );
                  },
                  child: CircleAvatar(
                    radius: 50.r,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.w),
                        borderRadius: BorderRadius.circular(50.r),
                        image: DecorationImage(
                          image: NetworkImage(
                            AppShared.currentUser!.user.imageProfile,
                          ),
                          fit: BoxFit.cover,
                          onError: (_, a) => Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2.w),
                                borderRadius: BorderRadius.circular(50.r),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/avatar.png'),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1.h,
              indent: 50,
              endIndent: 50,
            ),
            DrawerTile(
              title: 'home'.tr(),
              icon: Icons.home_outlined,
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomeScreen();
                }));
              },
            ),
            DrawerTile(
              title: 'notification'.tr(),
              icon: Icons.notifications_none_outlined,
              onTap: () async {
                await Navigator.of(context)
                    .pushNamed('move_to_notification_screen');
              },
            ),
            DrawerTile(
              title: 'my_cart'.tr(),
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
              title: 'chat'.tr(),
              icon: CustomIcon.ic_contact_chat,
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('move_to_chat_screen');
              },
            ),
            DrawerTile(
              title: 'order'.tr(),
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
              title: 'order_products'.tr(),
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
              title: 'additional_services'.tr(),
              icon: Icons.monetization_on_outlined,
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('move_to_additional_services_screen');
              },
            ),
            DrawerTile(
              title: 'pos'.tr(),
              icon: CustomIcon.ic_contact_map_pin,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return PointOfSalesScreen();
                    },
                  ),
                );
              },
            ),
            DrawerTile(
              title: 'contact_us'.tr(),
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
              title: 'aboutUs'.tr(),
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
              title: 'setting'.tr(),
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
              height: 100.h,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  Text(
                    'powered_by'.tr(),
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13.sp,
                      color: const Color(0xff08a8ff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                    child: Container(
                      child: Image(
                        height: 100.h,
                        width: 100.w,
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
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
        leading: Icon(
          widget.icon,
          color: Colors.white,
          size: 26.sp,
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
