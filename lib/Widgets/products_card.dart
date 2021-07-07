import 'package:flutter/material.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';

class ProductsCard extends StatefulWidget {
  final oPrice, sPrice, rPrice;

  const ProductsCard({Key? key, this.oPrice, this.sPrice, this.rPrice})
      : super(key: key);

  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              height: 100,
              child: Image.asset(
                'assets/images/category.png',
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Text(
                'Name',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 15,
                  color: const Color(0xff08a8ff),
                ),
                children: [
                  TextSpan(
                    text: 'O|',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  TextSpan(
                    text: '\$${widget.oPrice}',
                    style: TextStyle(
                      color: const Color(0xff8b98b4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xfff5f5f5),
              ),
              child: Icon(
                CustomIcon.ic_ecommerce_cart,
                color: Color(0xff08A8FF),
                size: 20,
              ),
            ),
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 15,
                  color: const Color(0xff08a8ff),
                ),
                children: [
                  TextSpan(
                    text: 'S|',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  TextSpan(
                    text: '\$${widget.sPrice}',
                    style: TextStyle(
                      color: const Color(0xff8b98b4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xfff5f5f5),
              ),
              child: Icon(
                CustomIcon.ic_ecommerce_cart,
                color: Color(0xff08A8FF),
                size: 20,
              ),
            ),
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 15,
                  color: const Color(0xff08a8ff),
                ),
                children: [
                  TextSpan(
                    text: 'R|',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  TextSpan(
                    text: '\$${widget.rPrice}',
                    style: TextStyle(
                      color: const Color(0xff8b98b4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xfff5f5f5),
              ),
              child: Icon(
                CustomIcon.ic_ecommerce_cart,
                color: Color(0xff08A8FF),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
