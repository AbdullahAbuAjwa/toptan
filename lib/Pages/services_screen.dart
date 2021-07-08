import 'package:flutter/material.dart';
import 'package:toptan/Widgets/companies_card.dart';
import 'package:toptan/Widgets/search.dart';
import 'package:easy_localization/easy_localization.dart';
class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('services'.tr()),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Search(),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: GridView.count(
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
              shrinkWrap: true,
              children: [
                CompaniesCard(
                  image: 'assets/images/googleplay.png',
                  title: 'Google Play',
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_google_play_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/superbox.png',
                  title: 'Super Box',
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_super_box_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/superonline.png',
                  title: 'Super Online',
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_super_online_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/paysell.png',
                  title: 'Pay Sell',
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_pay_sell_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/googleplay.png',
                  title: 'Google Play',
                  onPress: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
