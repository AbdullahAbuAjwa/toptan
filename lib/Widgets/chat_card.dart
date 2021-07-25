import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final message, time, delivered, isMe;

  ChatCard({this.message, this.time, this.delivered, this.isMe});

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Color(0xffF3F4F7) : Color(0xff08A8FF);
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = isMe
        ? null
        : delivered
            ? Icons.done_all
            : Icons.done;
    final radius = isMe
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
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 0.5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Column(
            crossAxisAlignment: align,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Text(
                  message,
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 15,
                    color: isMe ? Colors.black : Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    height: 1.411764705882353,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      isMe ? '' : time,
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 11,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
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
