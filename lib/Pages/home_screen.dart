import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Provider/slider_provider.dart';
import 'package:toptan/Widgets/companies_card.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/slider_home.dart';
import 'package:easy_localization/easy_localization.dart';

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
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: Provider.of<SliderProvider>(context, listen: false)
                  .fetchSliders(Localizations.localeOf(context)),
              builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : snapshot.connectionState == ConnectionState.none
                          ? Center(
                              child: Text('check_internet'.tr(),
                                  style: TextStyle(fontSize: 22)),
                            )
                          : Consumer<SliderProvider>(
                              builder:
                                  (BuildContext context, data, Widget? child) =>
                                      ListView.builder(
                                itemCount: data.items!.length,
                                itemBuilder: (ctx, i) =>
                                    data.items![i].status == 'active'
                                        ? SliderHomeScreenCard(
                                            image: data.items![i].img,
                                            items: data.items,
                                            link: data.items![i].link,
                                          )
                                        : Container(),
                              ),
                            ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
              children: [
                CompaniesCard(
                  image: 'assets/images/line.png',
                  title: 'line'.tr(),
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_super_line_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/products.png',
                  title: 'products'.tr(),
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_products_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/services.png',
                  title: 'services'.tr(),
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_services_screen',
                    );
                  },
                ),
                CompaniesCard(
                  image: 'assets/images/mobile2.png',
                  title: 'mobile'.tr(),
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
      title: Text('home_screen'.tr()),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
