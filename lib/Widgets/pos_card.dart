import 'package:flutter/material.dart';

class POSCard extends StatefulWidget {
  final image;
  final name;
  final price;

  const POSCard({Key? key, this.image, this.name, this.price})
      : super(key: key);

  @override
  _POSCARDState createState() => _POSCARDState();
}

class _POSCARDState extends State<POSCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                'assets/images/avatar.png',
              ),
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                color: const Color(0xff445570),
              ),
            ),
            Text(
              '${widget.price}\$',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 23,
                color: const Color(0xff08a8ff),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
