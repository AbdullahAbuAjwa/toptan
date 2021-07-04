import 'package:flutter/material.dart';

class ServicePriceScreen extends StatefulWidget {
  @override
  _ServicePriceScreenState createState() => _ServicePriceScreenState();
}

class _ServicePriceScreenState extends State<ServicePriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Service Price'),
        centerTitle: true,
      ),
    );
  }
}
