import 'package:flutter/material.dart';

class BankAccountCard extends StatelessWidget {
  final nameBank;
  final nameAccount;
  final numAccount;

  BankAccountCard({this.nameBank, this.nameAccount, this.numAccount});

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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                nameBank,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff08a8ff),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Account Name: ',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: const Color(0xff445570),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: nameAccount,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: const Color(0xff445570),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Account Number: ',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: const Color(0xff445570),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: numAccount,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: const Color(0xff445570),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
