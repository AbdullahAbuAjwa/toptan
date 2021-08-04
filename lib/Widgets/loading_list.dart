import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget loadingNotifications() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Color(0xffe7e7e7),
            highlightColor: Colors.white,
            enabled: true,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, __) => Container(
                width: double.infinity,
                height: 160.h,
                margin: EdgeInsets.only(
                    left: 12.w, right: 12.w, top: 16.h, bottom: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x15000000),
                      offset: Offset(0, 1),
                      blurRadius: 3.r,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget loadingChat(context) {
  return Align(
    alignment: Alignment.topRight,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Shimmer.fromColors(
        baseColor: Color(0xffe7e7e7),
        highlightColor: Color(0xffd0d0d0),
        enabled: true,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, __) => Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 0.5.r,
                        spreadRadius: 1.0.r,
                        color: Colors.black.withOpacity(0.12))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget loadingPages(context) {
  return Container(
    child: Shimmer.fromColors(
      baseColor: Color(0xffe7e7e7),
      highlightColor: Color(0xffdcdcdc),
      enabled: true,
      child: Container(
        height: 300.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 0.5.r,
                spreadRadius: 1.r,
                color: Colors.black.withOpacity(0.12))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
      ),
    ),
  );
}

Widget loadingFaq() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    child: Column(
      children: <Widget>[
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Color(0xffe7e7e7),
            highlightColor: Colors.white,
            enabled: true,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, __) => Container(
                width: double.infinity,
                height: 80.h,
                margin: EdgeInsets.only(
                    left: 12.w, right: 12.w, top: 8.h, bottom: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x15000000),
                      offset: Offset(0, 1),
                      blurRadius: 3.r,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget loadingServices() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Shimmer.fromColors(
      baseColor: Color(0xffe7e7e7),
      highlightColor: Colors.white,
      enabled: true,
      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          childAspectRatio: 1.1,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (_, __) => Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget loadingServicesDetails() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child: Shimmer.fromColors(
      baseColor: Color(0xffe7e7e7),
      highlightColor: Colors.white,
      enabled: true,
      child: ListView.builder(
        itemCount: 3,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, __) => Container(
          height: 100.0,
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
}
