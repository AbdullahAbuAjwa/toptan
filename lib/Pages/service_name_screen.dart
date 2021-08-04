import 'package:flutter/material.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/send_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceNameScreen extends StatefulWidget {
  @override
  _ServiceNameScreenState createState() => _ServiceNameScreenState();
}

class _ServiceNameScreenState extends State<ServiceNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('Service Name'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 12.r),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 35.r,
                    backgroundImage: AssetImage(
                      'assets/images/avatar.png',
                    ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Text(
                      'manager Name',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 17.sp,
                        color: const Color(0xff323b4a),
                        letterSpacing: 0.51,
                        fontWeight: FontWeight.w500,
                        height: 1.3529411764705883,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  trailing: Text(
                    '10/09/2019',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff323b4a),
                      letterSpacing: 0.42,
                      height: 1.6428571428571428,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s'
                      'standard dummy text ever since the 1500s,',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        color: const Color(0xff445570),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'mobile_no'.tr(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16.sp,
                              color: const Color(0xff323b4a),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '0000-0000-0000',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
                              color: const Color(0xff4a494b),
                            ),
                          ),
                          Icon(
                            CustomIcon.ic_contact_mobile,
                            color: Color(0xff08A8FF),
                          )
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'photo_id'.tr(),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.sp,
                                color: const Color(0xff323b4a),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Icon(
                                CustomIcon.ic_devices_camera,
                                color: Color(0xff08A8FF),
                              ),
                              title: Text(
                                'edit'.tr(),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12.sp,
                                  color: const Color(0xff8d8d8d),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'image10001.jpg',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14.sp,
                                color: const Color(0xff323b4a),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'photo_QR_code'.tr(),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.sp,
                                color: const Color(0xff323b4a),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Icon(
                                CustomIcon.ic_devices_camera,
                                color: Color(0xff08A8FF),
                              ),
                              title: Text(
                                'edit'.tr(),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12.sp,
                                  color: const Color(0xff8d8d8d),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'image10002.jpg',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14.sp,
                                color: const Color(0xff323b4a),
                                letterSpacing: 0.168,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14.sp,
                          color: const Color(0xff445570),
                          letterSpacing: 0.42,
                          height: 1.4285714285714286,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Package Name',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 17.sp,
                              color: const Color(0xff445570),
                              letterSpacing: 0.51,
                              fontWeight: FontWeight.w500,
                              height: 1.3529411764705883,
                            ),
                          ),
                          Text(
                            '29\$',
                            textScaleFactor: 1.sp,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 25.sp,
                              color: const Color(0xff08a8ff),
                              letterSpacing: 0.75,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0.h),
              child: SendButton(),
            ),
          ],
        ),
      ),
    );
  }
}
