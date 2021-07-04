import 'package:flutter/material.dart';

class CategoriesProducts extends StatefulWidget {
  final titleCategory;

  const CategoriesProducts(this.titleCategory);

  @override
  _CategoriesProductsState createState() => _CategoriesProductsState();
}

class _CategoriesProductsState extends State<CategoriesProducts> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: const Color(0xffffffff),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.titleCategory,
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 14,
                color: const Color(0xff000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
