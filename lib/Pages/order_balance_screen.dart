import 'package:flutter/material.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';

class OrderBalanceScreen extends StatefulWidget {
  @override
  _OrderBalanceScreenState createState() => _OrderBalanceScreenState();
}

class _OrderBalanceScreenState extends State<OrderBalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Order Balance'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter the amount of value:',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 20),
              Container(
                width: 250,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(signed: false),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0xFFFAFAFA),
                    hintStyle:
                        new TextStyle(color: Color(0xFFd0cece), fontSize: 18),
                    hintText: "Amount",
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: const Color(0xffffffff),
                  ),
                  child: Icon(
                    CustomIcon.ic_devices_camera,
                    color: Color(0xff08A8FF),
                  ),
                ),
                title: Text(
                  'Select photo',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
              SizedBox(height: 350),
              Center(
                child: ElevatedButton(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
