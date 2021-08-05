import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:toptan/Helper/enum.dart';

class ShowToast {
  static void showToast(message, type,length) {
    if (type == MessageType.Success) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: length,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xffffffff),
          textColor: Colors.green,
          fontSize: 16.0);
    } else if (type == MessageType.Failed) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
