import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/cart_provider.dart';
import 'package:toptan/Provider/companies_products_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/loading_list.dart';
import 'package:toptan/Widgets/products_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsCompanyScreen extends StatefulWidget {
  @override
  _ProductsCompanyScreenState createState() => _ProductsCompanyScreenState();
}

class _ProductsCompanyScreenState extends State<ProductsCompanyScreen> {
  CartProvider? cartProvider;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('products'.tr()),
      body: ListView(
        children: [
          /*   Container(
            height: 60,
            margin: EdgeInsets.only(top: 25.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: [
                CategoriesProducts('All'),
                CategoriesProducts('Category 1'),
                CategoriesProducts('Category 2'),
                CategoriesProducts('Category 3'),
                CategoriesProducts('Category 4'),
              ],
            ),
          ),*/
          Container(
            margin:
                EdgeInsets.only(left: 8.w, right: 8.w, top: 25.h, bottom: 8.w),
            child: FutureBuilder(
              future:
                  Provider.of<CompaniesProductsProvider>(context, listen: false)
                      .getProductsByCompanyId(
                          Localizations.localeOf(context), data['companyId']),
              builder: (ctx, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none
                  ? loadingServices()
                  : Consumer<CompaniesProductsProvider>(
                      builder: (BuildContext context, data, Widget? child) =>
                          GridView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 0.5.h,
                        ),
                        itemCount: data.productItems!.length,
                        itemBuilder: (ctx, i) => ProductsCard(
                          oPrice: data.productItems![i].price1,
                          sPrice: data.productItems![i].price2,
                          rPrice: data.productItems![i].price3,
                          image: data.productItems![i].image,
                          name: data.productItems![i].name,
                          id: data.productItems![i].id,
                          onOPriceTap: () {
                            addToCart(data.productItems![i].id,
                                data.productItems![i].price1, 'O');
                            //print(data.productItems![i].price1);
                          },
                          onSPriceTap: () {
                            addToCart(data.productItems![i].id,
                                data.productItems![i].price2, 'S');
                            // print(data.productItems![i].price2);
                          },
                          onRPriceTap: () {
                            addToCart(data.productItems![i].id,
                                data.productItems![i].price3, 'R');
                            //      print(data.productItems![i].price3);
                          },
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addToCart(id, price, type) async {
    try {
      cartProvider!.isLoading = true;
      await cartProvider!.addToCart(
        Localizations.localeOf(context),
        productId: id,
        price: price,
        typePrice: type,
      );
      cartProvider!.isLoading = false;
      if (cartProvider!.appResponse!.status) {
        ShowToast.showToast(cartProvider!.appResponse!.message,
            MessageType.Success, Toast.LENGTH_SHORT);
      } else {
        ShowToast.showToast(cartProvider!.appResponse!.message,
            MessageType.Warning, Toast.LENGTH_LONG);
      }
    } catch (error) {
      cartProvider!.isLoading = false;
      print('error: ' + error.toString());
      throw (error);
    }
  }
}
