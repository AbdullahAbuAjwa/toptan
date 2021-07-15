import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/service_prices_provider.dart';
import 'package:toptan/Widgets/service_price_card.dart';

class ServicePriceScreen extends StatefulWidget {
  @override
  _ServicePriceScreenState createState() => _ServicePriceScreenState();
}

class _ServicePriceScreenState extends State<ServicePriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('service_prices'.tr()),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<ServicePricesProvider>(context, listen: false)
            .fetchServicePrices(Localizations.localeOf(context)),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<ServicePricesProvider>(
                builder: (BuildContext context, data, Widget? child) =>
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 8,
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
