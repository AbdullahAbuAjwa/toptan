import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/connect_provider.dart';

class CheckInternetScreen extends StatefulWidget {
  @override
  _CheckInternetScreenState createState() => _CheckInternetScreenState();
}

class _CheckInternetScreenState extends State<CheckInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Internet'),
      ),
      body: Center(
        child: Consumer<ConnectivityProvider>(
          builder: (BuildContext context,
              ConnectivityProvider connectivityProvider, Widget? child) {
            if (connectivityProvider.connectivity == ConnectivityResult.none) {
              return Text('CheckInternet');
            }
            return Text('');
          },
        ),
      ),
    );
  }
}
