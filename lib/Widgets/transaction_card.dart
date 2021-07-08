import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TransactionCard extends StatelessWidget {
  final name, date, previousPrice, price, isPositive;

  const TransactionCard({
    Key? key,
    this.name,
    this.date,
    this.previousPrice,
    this.price,
    this.isPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  color: const Color(0xff616161),
                ),
                textAlign: TextAlign.left,
              ),
              // Adobe XD layer: 'New Text Document' (text)
              Text(
                'Previous'.tr() + ' \$$previousPrice',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: const Color(0xff536178),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: const Color(0xffafafaf),
                ),
              ),
              // Adobe XD layer: 'New Text Document' (text)
              Text(
                isPositive ? '+\$$price' : '-\$$price',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: isPositive ? Color(0xff009700) : Color(0xffFF6969),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
