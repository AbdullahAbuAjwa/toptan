import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Widgets/login_card.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08a8ff),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 90),
              child: Text(
                'Toptan',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 72,
                  color: const Color(0x99000000),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child:
                LoginCard(),
          )
        ],
      ),
    );
  }
}
