import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w, bottom: 5.h),
      child: Container(
        height: 55.h,
        child: TextFormField(
          // controller: widget.searchController,
          // onChanged: (v){
          //
          // },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 24.sp,
            ),
            fillColor: Color(0xFFFAFAFA),
            hintStyle: new TextStyle(color: Color(0xFFd0cece), fontSize: 18.sp),
            hintText: "search".tr(),
          ),
        ),
      ),
    );
  }
}
