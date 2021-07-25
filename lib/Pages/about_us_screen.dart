import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/pages_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  PagesProvider? pagesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pagesProvider = Provider.of<PagesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
        return false;
      },
      child: Scaffold(
        drawer: AppDrawer(),
        backgroundColor: Color(0xff08A8FF),
        appBar: appBarAppWithNotification('aboutUs'.tr(), context),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: FutureBuilder(
            future:
                pagesProvider!.fetchPages(Localizations.localeOf(context), 4),
            builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: SpinKitDualRing(
                          color: Colors.blue,
                        ),
                      )
                    : Consumer<PagesProvider>(
                        // child: Center(
                        //   child: Text('check_internet'.tr(),
                        //       style: TextStyle(fontSize: 22)),
                        // ),
                        builder: (context, data, child) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  pagesProvider!.pagesResponse!.page!.title,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    color: const Color(0xff1c0505),
                                    letterSpacing: 0.24,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 35),
                                Html(
                                  data: pagesProvider!
                                      .pagesResponse!.page!.description,
                                ),
                              ],
                            ),
                          ),
                          //     ),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
