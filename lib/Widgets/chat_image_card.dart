import 'package:flutter/material.dart';

class ChatImageCard extends StatelessWidget {
  final userId, message, sender, read, type, date, time;

  ChatImageCard(
      {this.userId,
      required this.message,
      required this.sender,
      this.read,
      this.type,
      required this.date,
      required this.time});

  @override
  Widget build(BuildContext context) {
    final align =
        sender == 1 ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final bg = sender == 1 ? Color(0xffF3F4F7) : Color(0xff08A8FF);
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
    final radiusImage = sender == 1
        ? BorderRadius.only(
            topRight: Radius.circular(20.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(20.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.38,
          width: MediaQuery.of(context).size.width / 2,
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.only(bottom: 5.0),
          decoration: BoxDecoration(
            borderRadius: radius,
            color: bg,
          ),
          child: Column(
            crossAxisAlignment: align,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: radiusImage,
                  child: Image.network(
                    message,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.34,
                    errorBuilder: (context, error, track) => Container(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0, right: 8, left: 8),
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
        ),
      ],
    );
  }
}
