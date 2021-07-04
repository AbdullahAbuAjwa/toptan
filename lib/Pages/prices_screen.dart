import 'package:flutter/material.dart';
import 'package:toptan/Widgets/price_card.dart';

class PricesScreen extends StatefulWidget {
  @override
  _PricesScreenState createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Price\'s'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 16,
        childAspectRatio: 1.4,
        mainAxisSpacing: 16,
        children: [
          PriceCard(price: '75', title: 'New Line'),
          PriceCard(price: '150', title: 'Golden Line'),
          PriceCard(price: '30', title: 'Transfer Line'),
          PriceCard(price: '5', title: 'Commission'),
          PriceCard(price: '75', title: 'New Line'),
          PriceCard(price: '150', title: 'Golden Line'),
        ],
      ),
    );
  }
}
