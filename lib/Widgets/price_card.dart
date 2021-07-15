import 'package:flutter/material.dart';

class PriceCard extends StatefulWidget {
  final price;
  final title;

  const PriceCard({Key? key, this.price, this.title}) : super(key: key);

  @override
  _PriceCardState createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${widget.price}\$',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 23,
                  color: const Color(0xff08a8ff),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  color: const Color(0xff445570),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
