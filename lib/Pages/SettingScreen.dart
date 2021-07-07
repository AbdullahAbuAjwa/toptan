import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/login_provider.dart';
import 'package:toptan/Widgets/drawer.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notificationsEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Setting'),
        centerTitle: true,
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
          child: ListView(
            physics: ScrollPhysics(),
            children: [
              ListTile(
                title: Text(
                  'Language',
                  style: titleTextStyle(),
                ),
                subtitle: Text('English'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: const Color(0xff616161),
                      letterSpacing: 0.168,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Password',
                  style: titleTextStyle(),
                ),
                subtitle: Text('********'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: const Color(0xff616161),
                      letterSpacing: 0.168,
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
                  'Notifications',
                  style: titleTextStyle(),
                ),
                activeColor: Color(0xff08A8FF),
              ),
              SizedBox(height: 50),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    'move_to_faq_screen',
                  );
                },
                title: Text(
                  'FAQ',
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
                    'move_to_privacy_policy_screen',
                  );
                },
                title: Text(
                  'Privacy Policy',
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
                  'Terms Of Use',
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
                  signOut();
                },
                title: Text(
                  'Log out',
                  style: titleTextStyle(),
                ),
                trailing: Icon(
                  CustomIcon.ic_security_locked,
                  color: Color(0xff08A8FF),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signOut() {
    Navigator.of(context).pushReplacementNamed('move_to_login_screen');
    /*   try {
      Provider.of<LoginProvider>(context, listen: false).logout();
      ShowToast.showToast('Logout success', MessageType.Success);
     // Navigator.of(context).pushReplacementNamed('move_to_login_screen');
    } catch (error) {
      ShowToast.showToast('Logout Failed', MessageType.Failed);

      print('error: ' + error.toString());
    }*/
  }

  titleTextStyle() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      color: const Color(0xff000000),
      letterSpacing: 0.192,
      fontWeight: FontWeight.w500,
    );
  }
}
