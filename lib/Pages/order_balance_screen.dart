import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/order_balance_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBalanceScreen extends StatefulWidget {
  @override
  _OrderBalanceScreenState createState() => _OrderBalanceScreenState();
}

class _OrderBalanceScreenState extends State<OrderBalanceScreen> {
  final _amountController = TextEditingController();
  File? imageFile;
  final formKey = GlobalKey<FormState>();
  OrderBalanceProvider? orderBalanceProvider;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    orderBalanceProvider =
        Provider.of<OrderBalanceProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      setState(() {});
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await picker.getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      setState(() {});
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('photo_library'.tr()),
                      onTap: () {
                        _getFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('camera'.tr()),
                    onTap: () {
                      _getFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('order_balance'.tr()),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.0.h, left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'enter_amount_of_value'.tr(),
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: 250.w,
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: _amountController,
                        keyboardType:
                            TextInputType.numberWithOptions(signed: false),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter_amount'.tr();
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0.r)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFFAFAFA),
                          hintStyle: TextStyle(
                              color: Color(0xFFd0cece), fontSize: 18.sp),
                          hintText: "amount".tr(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ListTile(
                    onTap: () {
                      _showPicker(context);
                    },
                    leading: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: const Color(0xffffffff),
                      ),
                      child: Icon(
                        CustomIcon.ic_devices_camera,
                        color: Color(0xff08A8FF),
                        size: 25.sp,
                      ),
                    ),
                    title: Text(
                      imageFile == null ? 'select_photo'.tr() : imageFile!.path,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  SizedBox(height: 280.h),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        createOrderBalance();
                        // Navigator.of(context).pushReplacementNamed(
                        //   'move_to_send_request_screen',
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0.r),
                        ),
                        primary: Colors.white,
                        fixedSize: Size(250.w, 55.h),
                      ),
                      child: Text(
                        'send'.tr(),
                        style: TextStyle(
                          color: Color(0xff08A8FF),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (Provider.of<OrderBalanceProvider>(context).isLoading)
              Center(
                child: SpinKitDualRing(
                  color: Colors.white,
                ),
              )
          ],
        ),
      ),
    );
  }

  Future<void> createOrderBalance() async {
    if (!formKey.currentState!.validate() || imageFile == null) return;

    try {
      MultipartFile img = await MultipartFile.fromFile(imageFile!.path);
      orderBalanceProvider!.isLoading = true;

      await orderBalanceProvider!.createOrderBalance(
        _amountController.text.trim(),
        img,
        Localizations.localeOf(context),
      );
      orderBalanceProvider!.isLoading = false;

      if (orderBalanceProvider!.appResponse!.status) {
        ShowToast.showToast(
            orderBalanceProvider!.appResponse!.message, MessageType.Success,Toast.LENGTH_SHORT);
        Navigator.pushReplacementNamed(context, 'move_to_send_request_screen');
        //   _amountController.clear();
      } else {
        ShowToast.showToast(
            orderBalanceProvider!.appResponse!.message, MessageType.Warning,Toast.LENGTH_LONG);
      }
    } catch (error) {
      orderBalanceProvider!.isLoading = false;
      print('error: ' + error.toString());
      throw (error);
    }
  }
}
