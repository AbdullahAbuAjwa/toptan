import 'package:flutter/material.dart';
import 'package:toptan/Icons/custom_icon_icons.dart';
import 'package:toptan/Widgets/companies_card.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/slider_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      drawer: AppDrawer(),
      appBar: appBarHomeScreen(),
      body: Column(
        children: [
          SliderHomeScreen(),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
              children: [
                CompaniesCard(
                  image: 'assets/images/line.png',
                  title: 'Line',
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_super_line_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/products.png',
                  title: 'Products',
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_products_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/services.png',
                  title: 'Services',
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_services_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/mobile2.png',
                  title: 'Mobile',
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_mobile_screen',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  appBarHomeScreen() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xff08A8FF),
      title: Text('Home Screen'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('move_to_financial_movements_screen');
            },
            child: Row(
              children: [
                Text(
                  '\$2000',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xffefff02),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  CustomIcon.ic_shopping_wallet,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
