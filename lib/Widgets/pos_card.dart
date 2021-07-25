import 'package:flutter/material.dart';

class POSCard extends StatefulWidget {
  final image;
  final name;
  final phoneNumber;

  const POSCard({Key? key, this.image, this.name, this.phoneNumber})
      : super(key: key);

  @override
  _POSCARDState createState() => _POSCARDState();
}

class _POSCARDState extends State<POSCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
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
                backgroundImage: NetworkImage(
                  widget.image,
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
                '${widget.phoneNumber}',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: const Color(0xff08a8ff),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
