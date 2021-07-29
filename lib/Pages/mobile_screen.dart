import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/company_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/companies_card.dart';
import 'package:toptan/Widgets/loading_list.dart';
import 'package:easy_localization/easy_localization.dart';

class MobileScreen extends StatefulWidget {
  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final _searchController = TextEditingController();
  CompanyProvider? companyProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    companyProvider = Provider.of<CompanyProvider>(context, listen: false);
    _searchController.clear();
    companyProvider!.onSearchTextChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('mobile'.tr()),
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
                    companyProvider!.onSearchTextChanged(v);
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
                        Provider.of<CompanyProvider>(context,listen: false)
                            .onSearchTextChanged('');
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
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: Provider.of<CompanyProvider>(context, listen: false)
                  .fetchCompanies(Localizations.localeOf(context)),
              builder: (ctx, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none
                  ? loadingServices()
                  : Consumer<CompanyProvider>(
                      builder: (BuildContext context, data, Widget? child) =>
                          data.itemsFounded!.length != 0 ||
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
                                  itemCount: data.itemsFounded!.length,
                                  itemBuilder: (ctx, i) => CompaniesCard(
                                    title: data.items![i].name,
                                    image: data.items![i].logo,
                                  ),
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
                                  itemBuilder: (ctx, i) => CompaniesCard(
                                    title: data.items![i].name,
                                    image: data.items![i].logo,
                                  ),
                                ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
