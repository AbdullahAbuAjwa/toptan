import 'package:flutter/material.dart';

class InvoiceLineCard extends StatefulWidget {
  @override
  _InvoiceLineCardState createState() => _InvoiceLineCardState();
}

class _InvoiceLineCardState extends State<InvoiceLineCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 220,
      margin: EdgeInsets.only(top: 15),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: const Color(0xff445570),
                    ),
                    children: [
                      TextSpan(
                        text: '2',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'GB',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: const Color(0xff445570),
                    ),
                    children: [
                      TextSpan(
                        text: '500',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'DK',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: const Color(0xff445570),
                    ),
                    children: [
                      TextSpan(
                        text: '100',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'SMS',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
