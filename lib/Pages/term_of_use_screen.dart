import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/pages_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';

class TermOfUseScreen extends StatefulWidget {
  @override
  _TermOfUseScreenState createState() => _TermOfUseScreenState();
}

class _TermOfUseScreenState extends State<TermOfUseScreen> {
  PagesProvider? pagesProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    pagesProvider = Provider.of<PagesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('terms_of_use'.tr()),
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
          future: pagesProvider!.fetchPages(Localizations.localeOf(context), 3),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: SpinKitDualRing(
                        color: Colors.blue,
                      ),
                    )
                  : Consumer<PagesProvider>(
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
    );
  }
}
