import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/prices_provider.dart';
import 'package:toptan/Widgets/price_card.dart';
import 'package:easy_localization/easy_localization.dart';

class PricesScreen extends StatefulWidget {
  @override
  _PricesScreenState createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('prices'.tr()),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<PricesProvider>(context, listen: false)
            .fetchPrices(Localizations.localeOf(context)),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<PricesProvider>(
                builder: (BuildContext context, data, Widget? child) =>
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1.4,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: data.items!.length,
                        itemBuilder: (ctx, i) => PriceCard(
                              price: data.items![i].price,
                              title: data.items![i].lineOperations!.name,
                            )),
              ),
      ),
    );
  }
}
