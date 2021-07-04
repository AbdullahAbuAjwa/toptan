import 'package:flutter/material.dart';
import 'package:toptan/Icons/custom_icon_icons.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Reset Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Text(
              'Toptan',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 72,
                color: const Color(0x99000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 65),
            Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 28,
                color: const Color(0xff323b4a),
                letterSpacing: 0.336,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Make amazing and clean iOS 11 \nwireframes for your next app project.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0xff323b4a),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  suffixIcon: Icon(
                    CustomIcon.ic_security_locked,
                    color: Color(0xff08A8FF),
                  ),
                  fillColor: Colors.white,
                  hintText: '********',
                  hintStyle: TextStyle(
                    color: Color(0xff4A494B),
                  ),
                ),
              ),
            ),
            SizedBox(height: 65),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  'move_to_login_screen',
                );
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                primary: Colors.white,
                fixedSize: Size(250, 55),
              ),
              child: Text(
                'RESET',
                style: TextStyle(
                  color: Color(0xff08A8FF),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
