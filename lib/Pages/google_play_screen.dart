import 'package:flutter/material.dart';
import 'package:toptan/Widgets/googleplay_card.dart';
import 'package:toptan/Widgets/send_button.dart';
import 'package:easy_localization/easy_localization.dart';

class GooglePlayScreen extends StatefulWidget {
  @override
  _GooglePlayScreenState createState() => _GooglePlayScreenState();
}

class _GooglePlayScreenState extends State<GooglePlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('google_play'.tr()),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'choose_right_price'.tr(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          GooglePlayCard(),
          GooglePlayCard(),
          SizedBox(height: 150),
          SendButton()
        ],
      ),
    );
  }
}
