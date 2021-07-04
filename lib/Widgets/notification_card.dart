import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 12.0, right: 12, top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0x15000000),
            offset: Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15, bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'iOS 11 Wireframes\nfor iPhone X',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: const Color(0xff4a494b),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    'Make amazing and clean iOS 11\nwireframes for your next app project.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: const Color(0xff4a494b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/mobile.png',
                  height: 120,
                  width: 120,
                ),
                Text(
                  '10/09/2019',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: const Color(0xff323b4a),
                    letterSpacing: 0.4,
                    height: 1.5,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
