import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Search extends StatefulWidget {
  // final TextEditingController searchController;
  // final Function onTap;
  // final text;
  //
  // Search(this.searchController, this.onTap, this.text);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: Container(
        height: 55,
        child: TextFormField(
          // controller: widget.searchController,
          // onChanged: (v){
          //
          // },
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
            fillColor: Color(0xFFFAFAFA),
            hintStyle: new TextStyle(color: Color(0xFFd0cece), fontSize: 18),
            hintText: "search".tr(),
          ),
        ),
      ),
    );
  }
}
