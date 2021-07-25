import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/pos_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/button.dart';
import 'package:easy_localization/easy_localization.dart';

class CreatePOSScreen extends StatefulWidget {
  @override
  _CreatePOSScreenState createState() => _CreatePOSScreenState();
}

class _CreatePOSScreenState extends State<CreatePOSScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  var valueNumber;
  PointOfSaleProvider? pointOfSaleProvider;
  var imageFile;

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
    // TODO: implement initState
    super.initState();
    pointOfSaleProvider =
        Provider.of<PointOfSaleProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('create_POS'.tr()),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 53,
                        backgroundColor: Colors.white,
                        child: imageFile == null
                            ? CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                                radius: 50,
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(imageFile),
                                radius: 50,
                              ),
                      ),
                      Positioned(
                        top: 72,
                        child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: const Color(0xffffffff),
                            ),
                            child: Icon(
                              CustomIcon.ic_devices_camera,
                              size: 18,
                              color: Color(0xff08A8FF),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
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
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            textInputAction: TextInputAction.next,
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
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                CustomIcon.ic_contact_mobile,
                                color: Color(0xff08A8FF),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter_your_email'.tr();
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'email'.tr(),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                CustomIcon.ic_contact_mail,
                                size: 18,
                                color: Color(0xff08A8FF),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter_your_password'.tr();
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'password'.tr(),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                CustomIcon.ic_security_locked,
                                color: Color(0xff08A8FF),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(6.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  hint: Text('government'.tr()),
                                  itemHeight: 50,
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Color(0xff08A8FF),
                                    size: 30,
                                  ),
                                  value: valueNumber,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Qatar'),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Saudi Arabia'),
                                      value: 2,
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        valueNumber = value;
                                        print(valueNumber);
                                      },
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            controller: _addressController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter_your_address'.tr();
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'address'.tr(),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                CustomIcon.ic_contact_map_pin,
                                color: Color(0xff08A8FF),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                    child: ButtonSend(
                      onTap: () {
                        createPointOfSale();
                      },
                      text: 'send'.tr(),
                      buttonColor: Colors.white,
                      textColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            if (Provider.of<PointOfSaleProvider>(context).isLoading)
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

  Future<void> createPointOfSale() async {
    if (!_formKey.currentState!.validate()) return;
    MultipartFile? img;
    pointOfSaleProvider!.isLoading = true;

    try {
    if (imageFile != null) {
      img = await MultipartFile.fromFile(imageFile!.path);
    }
    await pointOfSaleProvider!.addPointOfSale(Localizations.localeOf(context),
        name: _nameController.text.trim(),
        mobile: _mobileController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        government: valueNumber,
        address: _addressController.text.trim(),
        profileImage: img);
    pointOfSaleProvider!.isLoading = false;
    if (pointOfSaleProvider!.appResponse!.status) {
      ShowToast.showToast(
          pointOfSaleProvider!.appResponse!.message, MessageType.Success);
      Navigator.pushReplacementNamed(context, 'move_to_home_screen');
    } else {
      ShowToast.showToast(
          pointOfSaleProvider!.appResponse!.msg, MessageType.Failed);
    }
    } catch (error) {
      pointOfSaleProvider!.isLoading = false;

      print('error: ' + error.toString());
      throw (error);
    }
  }
}
