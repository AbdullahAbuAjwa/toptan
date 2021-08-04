import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/user_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toptan/Widgets/app_bar.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  var imageFile;
  UserProvider? userProvider;

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
    _nameController.text = AppShared.currentUser!.user.name;
    _mobileController.text = AppShared.currentUser!.user.mobile;
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('edit_profile'.tr()),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 45.h),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.w),
                            borderRadius: BorderRadius.circular(60.0.r),
                            image: imageFile == null
                                ? DecorationImage(
                                    image: NetworkImage(
                                      AppShared.currentUser!.user.imageProfile,
                                    ),
                                    fit: BoxFit.cover,
                                    onError: (_, a) => Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 2.w),
                                        borderRadius:
                                            BorderRadius.circular(60.0.r),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/avatar.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : DecorationImage(
                                    image: FileImage(imageFile),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 82.sp,
                        child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: const Color(0xffffffff),
                            ),
                            child: Icon(
                              CustomIcon.ic_devices_camera,
                              size: 18.sp,
                              color: Color(0xff08A8FF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 18.0.sp, vertical: 18.sp),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: _nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter_your_name'.tr();
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'name'.tr(),
                              hintStyle: TextStyle(fontSize: 17.sp),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0.r)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.phone,
                            controller: _mobileController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter_your_mobile'.tr();
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'mobile'.tr(),
                              filled: true,
                              hintStyle: TextStyle(fontSize: 17.sp),
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                CustomIcon.ic_contact_mobile,
                                color: Color(0xff08A8FF),
                                size: 27.sp,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0.r)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {
                              editProfile();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(70.0.r),
                              ),
                              primary: Colors.white,
                              fixedSize: Size(250.w, 55.h),
                            ),
                            child: Text(
                              'edit_profile'.tr(),
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 17.sp,
                                color: const Color(0xff08a8ff),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (Provider.of<UserProvider>(context).isLoading)
              Center(
                child: SpinKitDualRing(
                  color: Colors.blue,
                ),
              )
          ],
        ),
      ),
    );
  }

  Future<void> editProfile() async {
    if (!_formKey.currentState!.validate()) return;
    if (_nameController.text == AppShared.currentUser!.user.name &&
        _mobileController.text == AppShared.currentUser!.user.mobile &&
        imageFile == null) {
      ShowToast.showToast('Nothing to update', MessageType.Failed);
      return;
    }
    userProvider!.isLoading = true;
    MultipartFile? img;
    try {
      if (imageFile != null) {
        img = await MultipartFile.fromFile(imageFile!.path);
      }
      userProvider!.isLoading = true;

      await userProvider!.editUserProfile(
        Localizations.localeOf(context),
        name: _nameController.text.trim(),
        image: img,
        mobile: _mobileController.text.trim(),
      );
      userProvider!.isLoading = false;

      if (userProvider!.editProfileResponse!.status) {
        ShowToast.showToast(
            userProvider!.editProfileResponse!.message, MessageType.Success);
        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
      } else {
        ShowToast.showToast(
            userProvider!.editProfileResponse!.message, MessageType.Warning);
      }
    } catch (error) {
      userProvider!.isLoading = false;
      print('error: ' + error.toString());
      throw (error);
    }
  }
}
