import 'package:flutter/material.dart';
import 'package:toptan/Widgets/send_button.dart';

class PaySellScreen extends StatefulWidget {
  @override
  _PaySellScreenState createState() => _PaySellScreenState();
}

class _PaySellScreenState extends State<PaySellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Pay Sell'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Text(
                  'Enter the amount of value :',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    letterSpacing: 0.24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  height: 55,
                  width: 200,
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle:
                            new TextStyle(color: Colors.grey, fontSize: 18),
                        hintText: "100\$",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 290.0),
                child: SendButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
