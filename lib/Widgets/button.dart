import 'package:flutter/material.dart';

class ButtonSend extends StatelessWidget {
  final onTap;
  final text;
  final buttonColor;
  final textColor;

  ButtonSend({
    required this.onTap,
    required this.text,
    required this.buttonColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        primary: buttonColor,
        fixedSize: Size(250, 60),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
