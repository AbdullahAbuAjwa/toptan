import 'package:flutter/material.dart';

class ServicePricesCard extends StatefulWidget {
  final name;
  final price;
  final nameService;
  final details;

  ServicePricesCard({this.name, this.price, this.nameService, this.details});

  @override
  _ServicePricesCardState createState() => _ServicePricesCardState();
}

class _ServicePricesCardState extends State<ServicePricesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${widget.name}',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff08a8ff),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${widget.price}\$',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                          color: const Color(0xff08a8ff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.nameService,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  color: const Color(0xff445570),
                ),
              ),
              Text(
                widget.details,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  color: const Color(0xff445570),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
