import 'package:flutter/material.dart';
import 'package:toptan/Widgets/categories_products.dart';
import 'package:toptan/Widgets/products_card.dart';
import 'package:toptan/Widgets/search.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Products'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Search(),
          Container(
            height: 60,
            margin: EdgeInsets.only(top: 25),
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
          ),
          Container(
            margin: EdgeInsets.only(left: 8, right: 8, top: 25, bottom: 8),
            child: GridView.count(
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
              shrinkWrap: true,
              children: [
                ProductsCard(oPrice: '1000', rPrice: '2000', sPrice: '898'),
                ProductsCard(oPrice: '1000', rPrice: '2000', sPrice: '898'),
                ProductsCard(oPrice: '1000', rPrice: '2000', sPrice: '898'),
                ProductsCard(oPrice: '1000', rPrice: '2000', sPrice: '898'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
