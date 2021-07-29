import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/service_provider.dart';

class ServiceDetailsCard extends StatefulWidget {
  final id;
  final name;
  final details;
  final price;
  late bool selected;
  final Function onTap;

  ServiceDetailsCard({
    this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.selected,
    required this.onTap,
  });

  @override
  _ServiceDetailsCardState createState() => _ServiceDetailsCardState();
}

class _ServiceDetailsCardState extends State<ServiceDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          setState(() {});
          // intSelected = widget.id;
          widget.selected = !widget.selected;
          // print(intSelected);
          widget.onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.price.toString()}\$',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 35,
                    color: const Color(0xff08a8ff),
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.name}: ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff445570),
                            ),
                          ),
                          Text(
                            widget.details,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 17,
                              color: const Color(0xff445570),
                            ),
                          ),
                        ],
                      ),
                      widget.selected
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 40,
                                color: Color(0xff08a8ff),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
