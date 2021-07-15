import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  // Notifications? notifications;
  //
  // NotificationCard({this.notifications});
  String? title;
  String? message;
  String? createdAt;

  NotificationCard({this.title, this.message, this.createdAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 12.0, right: 12, top: 16, bottom: 8),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      height: 1,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4a494b),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Text(
                      message!,
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
                flex: 1,
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
                        createdAt!,
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
      ),
    );
  }
}
