import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Widgets/transaction_card.dart';

class FinancialMovementsScreen extends StatefulWidget {
  @override
  _FinancialMovementsScreenState createState() =>
      _FinancialMovementsScreenState();
}

class _FinancialMovementsScreenState extends State<FinancialMovementsScreen> {
  var value = period.Daily;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('financial_movements'.tr()),
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
                            text: 'spent'.tr(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: '\n\/\$2000',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 28,
                                  color: const Color(0xffefff02),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '\n\$3000',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w300,
                                  height: 1.5,
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
                          child: Center(
                            child: Text(
                              'transactions'.tr(),
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
                        ),
                        Expanded(
                          child: Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  closeProgressThreshold: 1.5,
                                  builder: (context) => SingleChildScrollView(
                                    controller:
                                        ModalScrollController.of(context),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            value = period.Daily;
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: ListTile(
                                            title: Text('daily'.tr()),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            value = period.Monthly;
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: ListTile(
                                            title: Text('monthly'.tr()),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            value = period.Yearly;
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: ListTile(
                                            title: Text('yearly'.tr()),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  value == period.Daily
                                      ? 'daily'.tr()
                                      : value == period.Monthly
                                          ? 'monthly'.tr()
                                          : 'yearly'.tr(),
                                  style: TextStyle(color: Color(0xff616161)),
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                  color: Color(0xff08A8FF),
                                ),
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
