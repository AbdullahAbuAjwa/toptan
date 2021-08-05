import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/user_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toptan/model/response/user.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notificationsEnable = true;
  var langValue;
  UserProvider? userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
        return false;
      },
      child: Scaffold(
        drawer: AppDrawer(),
        backgroundColor: Color(0xff08A8FF),
        appBar: appBarAppWithNotification('setting'.tr(), context),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0.r),
              topRight: Radius.circular(20.0.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.0.w, right: 10.w, top: 30.h),
            child: ListView(
              physics: ScrollPhysics(),
              children: [
                ListTile(
                  title: Text(
                    'language'.tr(),
                    style: titleTextStyle(),
                  ),
                  subtitle: Text(
                    Localizations.localeOf(context).languageCode == 'ar'
                        ? 'arabic'.tr()
                        : Localizations.localeOf(context).languageCode == 'en'
                            ? 'english'.tr()
                            : 'turkish'.tr(),
                  ),
                  trailing: popupMenu(),
                ),
                ListTile(
                  title: Text(
                    'password'.tr(),
                    style: titleTextStyle(),
                  ),
                  subtitle: Text('********'),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'move_to_change_pass_screen');
                    },
                    child: Text(
                      'change'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff616161),
                      ),
                    ),
                  ),
                ),
                SwitchListTile(
                  value: notificationsEnable,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnable = value;
                    });
                  },
                  title: Text(
                    'notification'.tr(),
                    style: titleTextStyle(),
                  ),
                  activeColor: Color(0xff08A8FF),
                ),
                SizedBox(height: 50.h),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'move_to_faq_screen',
                    );
                  },
                  title: Text(
                    'faq'.tr(),
                    style: titleTextStyle(),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff08A8FF),
                    size: 20.sp,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'move_to_privacy_policy_screen',
                    );
                  },
                  title: Text(
                    'privacy_policy'.tr(),
                    style: titleTextStyle(),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff08A8FF),
                    size: 20,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'move_to_term_of_use_screen',
                    );
                  },
                  title: Text(
                    'terms_of_use'.tr(),
                    style: titleTextStyle(),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff08A8FF),
                    size: 20,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _showDialog(context);
                    //signOut();
                  },
                  title: Text(
                    'log_out'.tr(),
                    style: titleTextStyle(),
                  ),
                  trailing: Icon(
                    CustomIcon.ic_security_locked,
                    color: Color(0xff08A8FF),
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget popupMenu() {
    return PopupMenuButton<String>(
      itemBuilder: (_) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(
            child: Text('English'.tr(), style: TextStyle(fontSize: 18.sp)),
            value: 'en'),
        PopupMenuItem<String>(
            child: Text('Arabic'.tr(), style: TextStyle(fontSize: 18.sp)),
            value: 'ar'),
        PopupMenuItem<String>(
            child: Text('Turkish'.tr(), style: TextStyle(fontSize: 18.sp)),
            value: 'tr'),
      ],
      onSelected: (value) {
        value == 'ar'
            ? context.setLocale(Locale('ar'))
            : value == 'en'
                ? context.setLocale(Locale('en'))
                : context.setLocale(Locale('tr'));
        langValue = value;
        setState(() {});
      },
      child: Text(
        'change'.tr(),
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xff616161),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          title: Text('log_out'.tr()),
          content: Text('are_you_sure'.tr()),
          actions: <Widget>[
            TextButton(
              child: Text('yes'.tr()),
              onPressed: () {
                Navigator.of(context).pop();
                signOut();
              },
            ),
            TextButton(
              child: Text('cancel'.tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> signOut() async {
    try {
      await userProvider!.logout(Localizations.localeOf(context));
      if (userProvider!.appResponse!.status) {
        AppShared.currentUser = null;
        ShowToast.showToast(
            userProvider!.appResponse!.message, MessageType.Success,Toast.LENGTH_LONG);
        await Navigator.of(context)
            .pushReplacementNamed('move_to_login_screen');
      } else {
        ShowToast.showToast(
            userProvider!.appResponse!.message, MessageType.Failed,Toast.LENGTH_LONG);
      }
    } catch (error) {
      ShowToast.showToast('Logout Failed', MessageType.Failed,Toast.LENGTH_LONG);
      print('error: ' + error.toString());
    }
  }

  titleTextStyle() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.sp,
      color: const Color(0xff000000),
      fontWeight: FontWeight.w500,
    );
  }
}
