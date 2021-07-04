import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(
          'move_to_send_request_screen',
        );
      },
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        primary: Colors.white,
        fixedSize: Size(250, 55),
      ),
      child: Text(
        'SEND',
        style: TextStyle(
          color: Color(0xff08A8FF),
          fontSize: 16,
        ),
      ),
    );
  }
}
