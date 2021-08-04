import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/service_prices_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/service_price_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicePriceScreen extends StatefulWidget {
  @override
  _ServicePriceScreenState createState() => _ServicePriceScreenState();
}

class _ServicePriceScreenState extends State<ServicePriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('service_prices'.tr()),
      body: FutureBuilder(
        future: Provider.of<ServicePricesProvider>(context, listen: false)
            .fetchServicePrices(Localizations.localeOf(context)),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: SpinKitDualRing(color: Colors.white),
              )
            : Consumer<ServicePricesProvider>(
                builder: (BuildContext context, data, Widget? child) =>
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.w,
                          childAspectRatio: 0.9.h,
                          mainAxisSpacing: 8.h,
                        ),
                        itemCount: data.items!.length,
                        itemBuilder: (ctx, i) => ServicePricesCard(
                              name: data.items![i].serviceType!.name,
                              price: data.items![i].price,
                              details: data.items![i].service!.details,
                              nameService: data.items![i].service!.name,
                            )),
              ),
      ),
    );
  }
}
