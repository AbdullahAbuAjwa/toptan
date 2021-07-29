import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final image;
  final name;
  final onPress;

  const ServiceCard({Key? key, this.image, this.name, this.onPress})
      : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image.network(
                    widget.image,
                    height: 80,
                    fit: BoxFit.contain,
                    width: 90,
                    errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) =>
                        Image.asset(
                      'assets/images/paysell.png',
                      height: 90,
                      fit: BoxFit.contain,
                      width: 90,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 18,
                    color: const Color(0xfe000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
