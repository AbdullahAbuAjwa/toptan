import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/Pages/home_screen.dart';
import 'package:toptan/Pages/login_screen.dart';
import 'welcomeScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2000),
      () => AppShared.sharedPreferencesController!.showIntro()
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return WelcomeScreen();
                },
              ),
            )
          : !AppShared.sharedPreferencesController!.getIsLogin()
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LoginScreen();
                    },
                  ),
                )
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HomeScreen();
                    },
                  ),
                ).then(
                  (_) => AppShared.currentUser =
                      AppShared.sharedPreferencesController?.getUserData(),
                ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 65.sp,
            color: const Color(0x99000000),
            fontWeight: FontWeight.w700,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                '',
              ),
              TyperAnimatedText(
                'TopTan',
                speed: Duration(milliseconds: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
