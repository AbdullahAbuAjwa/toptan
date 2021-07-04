import 'package:flutter/material.dart';

class SendRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Send Request'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/send.png',
                height: 250,
                width: 200,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'The request was sent pending administration approval',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                    color: const Color(0xff323b4a),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    'move_to_home_screen',
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  primary: Color(0xff08A8FF),
                  fixedSize: Size(250, 55),
                ),
                child: Text(
                  'GO TO HOME',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
