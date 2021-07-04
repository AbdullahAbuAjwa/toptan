import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Card(
        elevation: 0,
        child: Row(
          children: [
            Image.asset(
              'assets/images/product.png',
              height: 150,
              width: 150,
            ),
            Column(
              children: [
                Text(
                  'Product Name',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 18,
                    color: const Color(0xfe000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 12),
                Text(
                  '\$1700',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 14,
                    color: const Color(0xff8b98b4),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Color(0xff8B98B4),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('5'),
                    ),
                    Icon(
                      Icons.remove_circle_outline,
                      color: Color(0xff8B98B4),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
