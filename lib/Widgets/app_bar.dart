import 'package:flutter/material.dart';

PreferredSizeWidget appBarApp(title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Color(0xff08A8FF),
  );
}

PreferredSizeWidget appBarAppWithNotification(title, context) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Color(0xff08A8FF),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('move_to_notification_screen');
          },
          child: Icon(Icons.notifications_none_outlined),
        ),
      ),
    ],
  );
}
