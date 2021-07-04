import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GooglePlayCard extends StatefulWidget {
  @override
  _GooglePlayCardState createState() => _GooglePlayCardState();
}

class _GooglePlayCardState extends State<GooglePlayCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      margin: EdgeInsets.only(top: 15),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '29\$',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 35,
                color: const Color(0xff08a8ff),
              ),
            ),
            Text(
              'Package Name',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
                color: const Color(0xff445570),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
