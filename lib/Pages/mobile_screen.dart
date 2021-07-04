import 'package:flutter/material.dart';
import 'package:toptan/Widgets/companies_card.dart';
import 'package:toptan/Widgets/search.dart';

class MobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Mobile'),
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
                  image: 'assets/images/samsonglogo.png',
                  title: 'Samsung Company',
                  onPress: () {},
                ),
                CompaniesCard(
                  image: 'assets/images/huaweilogo.png',
                  title: 'Huawei Company',
                  onPress: () {},
                ),
                CompaniesCard(
                  image: 'assets/images/applelogo.png',
                  title: 'Apple Company',
                  onPress: () {},
                ),
                CompaniesCard(
                  image: 'assets/images/samsonglogo.png',
                  title: 'Samsung Company',
                  onPress: () {},
                ),
                CompaniesCard(
                  image: 'assets/images/samsonglogo.png',
                  title: 'Samsung Company',
                  onPress: () {},
                ),
                CompaniesCard(
                  image: 'assets/images/samsonglogo.png',
                  title: 'Samsung Company',
                  onPress: () {},
                ),
                CompaniesCard(
                  image: 'assets/images/applelogo.png',
                  title: 'Apple Company',
                  onPress: () {},
                ),
                CompaniesCard(
                  image: 'assets/images/huaweilogo.png',
                  title: 'Huawei Company',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}