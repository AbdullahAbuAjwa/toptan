import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toptan/Icons/custom_icon_icons.dart';
import 'package:toptan/Widgets/transaction_card.dart';

class FinancialMovementsScreen extends StatefulWidget {
  @override
  _FinancialMovementsScreenState createState() =>
      _FinancialMovementsScreenState();
}

class _FinancialMovementsScreenState extends State<FinancialMovementsScreen> {
  var _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Financial Movements'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: 60,
                innerWidget: (double value) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ListTile(
                        leading: Icon(
                          CustomIcon.ic_shopping_wallet,
                          color: Colors.white,
                        ),
                        title: RichText(
                          text: TextSpan(
                            text: 'You\'re spent',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: '\n\$2000',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 28,
                                  color: const Color(0xffefff02),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '\nof \$3000',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: const Color(0xffffffff),
                                  letterSpacing: 0.42,
                                  fontWeight: FontWeight.w300,
                                  height: 1.1428571428571428,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                appearance: CircularSliderAppearance(
                  size: 200,
                  customWidths:
                      CustomSliderWidths(progressBarWidth: 6, trackWidth: 6),
                  customColors: CustomSliderColors(
                    progressBarColor: Color(0xff01396A),
                    trackColor: Colors.white,
                    dotColor: Color(0xff01396A),
                  ),
                ),
                onChange: (double value) {
                  //print(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Transactions',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: const Color(0xff000000),
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w500,
                              height: 0.95,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Card(
                            elevation: 6,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    hint: Text('Select'),
                                    itemHeight: 50,
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Color(0xff08A8FF),
                                      size: 30,
                                    ),
                                    value: _value,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Daily'),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Monthly'),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                        child: Text('annually'),
                                        value: 3,
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        TransactionCard(
                          name: 'Name',
                          date: '1/10/2020',
                          price: '600',
                          isPositive: true,
                          previousPrice: '2000',
                        ),
                        TransactionCard(
                          name: 'Name',
                          date: '1/10/2020',
                          price: '600',
                          isPositive: true,
                          previousPrice: '2000',
                        ),
                        TransactionCard(
                          name: 'Name',
                          date: '1/10/2020',
                          price: '600',
                          isPositive: false,
                          previousPrice: '2000',
                        ),
                        TransactionCard(
                          name: 'Name',
                          date: '1/10/2020',
                          price: '600',
                          isPositive: false,
                          previousPrice: '2000',
                        ),
                        TransactionCard(
                          name: 'Name',
                          date: '1/10/2020',
                          price: '600',
                          isPositive: false,
                          previousPrice: '2000',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
