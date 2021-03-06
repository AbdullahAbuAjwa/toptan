import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/faq_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/faq_card.dart';
import 'package:toptan/Widgets/loading_list.dart';
class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('faq'.tr()),
      body: FutureBuilder(
        future: Provider.of<FAQProvider>(context, listen: false)
            .fetchFAQ(Localizations.localeOf(context)),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? loadingFaq()
                : Consumer<FAQProvider>(
                    builder: (BuildContext context, data, Widget? child) =>
                        ListView.builder(
                      physics: ScrollPhysics(),
                      itemCount: data.items!.length,
                      itemBuilder: (ctx, i) => FAQCard(
                        question: data.items![i].question,
                        answer: data.items![i].answer,
                      ),
                    ),
                  ),
      ),
    );
  }
}
