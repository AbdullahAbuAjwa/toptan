import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final userId, message, sender, read, type, date, time;

  ChatCard(
      {this.userId,
      required this.message,
      required this.sender,
      this.read,
      this.type,
      required this.date,
      required this.time});

  @override
  Widget build(BuildContext context) {
    final bg = sender == 1 ? Color(0xffF3F4F7) : Color(0xff08A8FF);
    final align =
        sender == 1 ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final mainAlignment =
        sender == 1 ? MainAxisAlignment.start : MainAxisAlignment.end;
    final icon = sender == 1
        ? null
        : read == 1
            ? Icons.done_all
            : Icons.done;
    final radius = sender == 1
        ? BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 0.5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(0.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Column(
            crossAxisAlignment: align,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                // : EdgeInsets.only(left: 10.0),
                child: Text(
                  message,
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 15,
                    color: sender == 1 ? Colors.black : Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: mainAlignment,
                  children: <Widget>[
                    Text(
                      date + ' ' + time,
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 11,
                        color: sender == 1 ? Colors.black : Color(0xffffffff),
                      ),
                    ),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
