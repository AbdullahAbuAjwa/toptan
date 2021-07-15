import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

class ConnectivityProvider with ChangeNotifier {
  String? _connectionStatus ;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  set connectionStatus(String? value) {
    _connectionStatus = value;
  }

  String? get connectionStatus => _connectionStatus;

  Connectivity get connectivity => _connectivity;

  StreamSubscription<ConnectivityResult> get connectivitySubscription =>
      _connectivitySubscription;

  Future<void> initConnectivity(mounted) async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.none:
         //  setState(() =>
           _connectionStatus = result.toString();
        break;
      default:
          //setState(() =>
    _connectionStatus = 'Failed to get connectivity.';
        break;
    }
  }


  set connectivitySubscription(StreamSubscription<ConnectivityResult> value) {
    _connectivitySubscription = value;
  }

// ConnectivityResult get connectivity => _connectivityResult;
//
// String get svgUrl => _svgUrl;
//
// String get pageText => _pageText;

}
