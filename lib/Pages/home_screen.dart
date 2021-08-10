import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/slider_provider.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:toptan/Widgets/home_cards.dart';
import 'package:toptan/Widgets/slider_home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0.w, vertical: 10.h),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x15000000),
                                  offset: Offset(0, 1),
                                  blurRadius: 3.r,
                                ),
                              ],
                            ),
                          ),
                        )
                      : snapshot.connectionState == ConnectionState.none
                          ? Center(
                              child: Text('check_internet'.tr(),
                                  style: TextStyle(fontSize: 22.sp)),
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
          SizedBox(height: 30.h),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1.2.h,
              children: [
                HomeCards(
                  image: 'assets/images/line.png',
                  title: 'line'.tr(),
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_super_line_screen',
                    );
                  },
                ),
                HomeCards(
                  image: 'assets/images/products.png',
                  title: 'products'.tr(),
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_products_screen',
                    );
                  },
                ),
                HomeCards(
                  image: 'assets/images/services.png',
                  title: 'services'.tr(),
                  onPress: () {
                    Navigator.of(context).pushNamed(
                      'move_to_services_screen',
                    );
                  },
                ),
                HomeCards(
                  image: 'assets/images/mobile2.png',
                  title: 'mobile'.tr(),
                  onPress: () {
                    ShowToast.showToast(
                        'Soon', MessageType.Warning, Toast.LENGTH_SHORT);
                    // Navigator.of(context).pushNamed(
                    //   'move_to_mobile_screen',
                    // );
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
      title: Text(
        'home_screen'.tr(),
        style: TextStyle(fontSize: 22.sp),
      ),
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      //     child: InkWell(
      //       onTap: () {
      //         Navigator.of(context)
      //             .pushNamed('move_to_financial_movements_screen');
      //       },
      //       child: Row(
      //         children: [
      //           Text(
      //             '\$2000',
      //             style: TextStyle(
      //               fontFamily: 'Roboto',
      //               fontSize: 20.sp,
      //               color: const Color(0xffefff02),
      //               fontWeight: FontWeight.w500,
      //             ),
      //           ),
      //           SizedBox(width: 10.w),
      //           Icon(
      //             CustomIcon.ic_shopping_wallet,
      //             color: Colors.white,
      //             size: 25.sp,
      //           ),
      //         ],
      //       ),
      //     ),
      //   )
      // ],
    );
  }
}
