import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/service_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/loading_list.dart';
import 'package:toptan/Widgets/search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Widgets/service_card.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final _searchController = TextEditingController();
  ServiceProvider? serviceProvider;

  @override
  void initState() {
    super.initState();
    serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
    _searchController.clear();
    serviceProvider!.onSearchTextChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('services'.tr()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (v) {
                    serviceProvider!.onSearchTextChanged(v);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: new Icon(Icons.cancel),
                      onPressed: () {
                        _searchController.clear();
                        serviceProvider!.onSearchTextChanged('');
                      },
                    ),
                    fillColor: Color(0xFFFAFAFA),
                    hintStyle:
                    TextStyle(color: Color(0xFFd0cece), fontSize: 18),
                    hintText: "search".tr(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: Provider.of<ServiceProvider>(context, listen: false)
                  .fetchServicesTypes(Localizations.localeOf(context)),
              builder: (ctx, snapshot) =>
              snapshot.connectionState ==
                  ConnectionState.waiting
                  ? loadingServices()
                  : Consumer<ServiceProvider>(
                builder: (BuildContext context, data, Widget? child) =>
                data.serviceItemsFounded!.length != 0 ||
                    _searchController.text.isNotEmpty
                    ? GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: data.serviceItemsFounded!.length,
                  itemBuilder: (ctx, i) =>
                      ServiceCard(
                          name: data.serviceItemsFounded![i].name,
                          image: data.serviceItemsFounded![i].image,
                          onPress: () {
                            FocusScope.of(context).unfocus();
                            Navigator.pushNamed(context,
                                'move_to_service_details_screen',
                                arguments: {
                                  'id': data
                                      .serviceItemsFounded![i].id,
                                  'title': data
                                      .serviceItemsFounded![i].name
                                });
                          }),
                )
                    : GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: data.items!.length,
                  itemBuilder: (ctx, i) =>
                      ServiceCard(
                          name: data.items![i].name,
                          image: data.items![i].image,
                          onPress: () {
                            FocusScope.of(context).unfocus();
                            Navigator.pushNamed(context,
                                'move_to_service_details_screen',
                                arguments: {
                                  'id': data.items![i].id,
                                  'title': data.items![i].name
                                });
                          }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
