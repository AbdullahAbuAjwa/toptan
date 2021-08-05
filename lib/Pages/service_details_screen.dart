import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/service_provider.dart';
import 'package:toptan/Widgets/button.dart';
import 'package:toptan/Widgets/loading_list.dart';
import 'package:toptan/Widgets/service_details_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsScreen extends StatefulWidget {
  @override
  _ServiceDetailsScreenState createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  final _mobileController = TextEditingController();
  final _commentController = TextEditingController();
  ServiceProvider? serviceProvider;
  File? imageFile;
  int idSelected = 0;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      setState(() {});
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
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
  void initState() {
    super.initState();
    serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text(data['title']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 12.w, right: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'mobile_no'.tr(),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18.sp,
                            color: const Color(0xffffffff),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 50.h,
                          child: TextFormField(
                            controller: _mobileController,
                            keyboardType: TextInputType.phone,
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
                              suffixIcon: Icon(
                                CustomIcon.ic_devices_mobile,
                                color: Color(0xff08A8FF),
                                size: 25.sp,
                              ),
                              fillColor: Colors.white,
                              hintText: '0000-0000-0000',
                              hintStyle: TextStyle(
                                  color: Color(0xffc4c1c4), fontSize: 18.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 12.h),
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'photo_id'.tr(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18.sp,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            leading: Container(
                              height: 45.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.r)),
                                color: const Color(0xffffffff),
                              ),
                              child: Icon(
                                CustomIcon.ic_devices_camera,
                                color: Color(0xff08A8FF),
                                size: 25.sp,
                              ),
                            ),
                            title: Text(
                              imageFile == null
                                  ? 'attach_photo_id'.tr()
                                  : imageFile!.path.toString(),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.sp,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Localizations.localeOf(context).toString() == 'ar'
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 12.w, top: 15.h, right: 12.w),
                    child: Text(
                      'available_packages'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18.sp,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: Provider.of<ServiceProvider>(context, listen: false)
                      .fetchServicesById(
                          Localizations.localeOf(context), data['id']),
                  builder: (ctx, snapshot) => snapshot.connectionState ==
                              ConnectionState.waiting ||
                          snapshot.connectionState == ConnectionState.none
                      ? loadingServicesDetails()
                      : Consumer<ServiceProvider>(
                          builder: (BuildContext context, data,
                                  Widget? child) =>
                              ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.serviceItems!.length,
                                  itemBuilder: (ctx, i) {
                                    return ServiceDetailsCard(
                                      id: data.serviceItems![i].id,
                                      name: data.serviceItems![i].service!.name,
                                      details: data
                                          .serviceItems![i].service!.details,
                                      price: data
                                          .serviceItems![i].service!.costPrice,
                                      selected: data
                                          .serviceItems![i].service!.selected,
                                      onTap: () {
                                        idSelected = data.serviceItems![i].id;
                                        print(idSelected);
                                      },
                                    );
                                  }),
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),
                  height: 150.h,
                  margin:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    controller: _commentController,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'comment'.tr(),
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        color: const Color(0xff323b4a),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 25.h, bottom: 15.h),
                    child: ButtonSend(
                      onTap: () {
                        orderService(data['id'], idSelected);
                      },
                      buttonColor: Colors.white,
                      text: 'send'.tr(),
                      textColor: Color(0xff08A8FF),
                    )),
              ],
            ),
            if (Provider.of<ServiceProvider>(context, listen: false).isLoading)
              SpinKitDualRing(
                color: Colors.blue,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> orderService(typeId, serviceId) async {
    MultipartFile? img;
    serviceProvider!.isLoading = true;

    try {
      if (imageFile != null) {
        img = await MultipartFile.fromFile(imageFile!.path);
      }
      await serviceProvider!.orderServiceByServiceTypeId(
          Localizations.localeOf(context), typeId,
          mobile: _mobileController.text.trim(),
          comment: _commentController.text.trim(),
          serviceID: serviceId,
          photoId: img);
      serviceProvider!.isLoading = false;
      if (serviceProvider!.appResponse!.status) {
        ShowToast.showToast(
            serviceProvider!.appResponse!.message, MessageType.Success,Toast.LENGTH_LONG);
        Navigator.pushReplacementNamed(context, 'move_to_send_request_screen');
      } else {
        ShowToast.showToast(
            serviceProvider!.appResponse!.msg, MessageType.Failed,Toast.LENGTH_LONG);
      }
    } catch (error) {
      serviceProvider!.isLoading = false;
      print('error: ' + error.toString());
      throw (error);
    }
  }
}
