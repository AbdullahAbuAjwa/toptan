import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final name;
  final date;
  final status;

  const OrderCard({Key? key, this.name, this.date, this.status})
      : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('move_to_service_name_screen');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Card(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(
              widget.name,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
                color: const Color(0xff323b4a),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.date,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: const Color(0xff445570),
                ),
              ),
            ),
            trailing: Container(
              margin: EdgeInsets.only(top: 25),
              height: 25,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: widget.status == 'Waiting'
                    ? Color(0xfff9a22a)
                    : widget.status == 'Reject'
                        ? Color(0xffF92A30)
                        : Color(0xff04A35A),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x15000000),
                    offset: Offset(0, 1),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  widget.status,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: const Color(0xffffffff),
                    letterSpacing: 0.18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
