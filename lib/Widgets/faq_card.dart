import 'package:flutter/material.dart';

class FAQCard extends StatelessWidget {
  final question;
  final answer;

  FAQCard({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          child: ExpansionTile(
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xff08A8FF),
              size: 26,
            ),
            title: Text(question!),
            children: <Widget>[
              Align(
                alignment:
                    Localizations.localeOf(context).languageCode.toString() ==
                            'ar'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    answer!,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: const Color(0xff323b4a),
                      height: 1.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
