import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/contact_us_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/button.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:easy_localization/easy_localization.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _mobileFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _messageFocusNode = FocusNode();
  ContactUsProvider? contactUsProvider;

  @override
  void initState() {
    super.initState();
    contactUsProvider = Provider.of<ContactUsProvider>(context, listen: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    _nameFocusNode.dispose();
    _mobileFocusNode.dispose();
    _emailFocusNode.dispose();
    _messageFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
        return false;
      },
      child: Scaffold(
        drawer: AppDrawer(),
        backgroundColor: Color(0xff08A8FF),
        appBar: appBarAppWithNotification('contact_us'.tr(), context),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Stack(
            children: [
              ListView(
                children: [
                  Image.asset(
                    'assets/images/contact.png',
                    width: 300,
                    height: 200,
                    fit: BoxFit.scaleDown,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: Color(0xff08A8FF),
                    ),
                    title: Text(
                      'email'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff323b4a),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      'username@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff323b4a),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Color(0xff08A8FF),
                    ),
                    title: Text(
                      'mobile'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff323b4a),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      '000000000000',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff323b4a),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: _nameController,
                            focusNode: _nameFocusNode,
                            decoration: InputDecoration(
                              hintText: 'name'.tr(),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter_your_name'.tr();
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            decoration: InputDecoration(
                              hintText: 'email'.tr(),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                CustomIcon.ic_contact_mail,
                                color: Color(0xff08A8FF),
                                size: 18,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter_your_email'.tr();
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            controller: _mobileController,
                            focusNode: _mobileFocusNode,
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
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter_your_mobile'.tr();
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            elevation: 2,
                            child: Container(
                              height: 150,
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                controller: _messageController,
                                focusNode: _messageFocusNode,
                                maxLines: 8,
                                decoration: InputDecoration(
                                  hintText: 'message'.tr(),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter_your_message'.tr();
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8, bottom: 12.0),
                            child: ButtonSend(
                              onTap: () {
                                // if (contactUsProvider!
                                //     .isLoading) return;
                                sendMessage();
                              },
                              text: 'send'.tr(),
                              textColor: Colors.white,
                              buttonColor: Color(0xff08A8FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (Provider.of<ContactUsProvider>(context).isLoading)
                Center(
                  child: SpinKitDualRing(
                    color: Colors.blue,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendMessage() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      contactUsProvider!.isLoading = true;
      await contactUsProvider!.contactUs(
          _nameController.text.trim(),
          _mobileController.text.trim(),
          _emailController.text.trim(),
          _messageController.text.trim(),
          Localizations.localeOf(context));
      contactUsProvider!.isLoading = false;
      if (contactUsProvider!.appResponse!.status) {
        ShowToast.showToast(
            contactUsProvider!.appResponse!.message, MessageType.Success);
        clear();
      } else {
        ShowToast.showToast('Failed', MessageType.Warning);
      }
    } catch (error) {
      contactUsProvider!.isLoading = false;
      print('error: ' + error.toString());
      throw (error);
    }
  }

  clear() {
    Timer(Duration(milliseconds: 1000), () {
      _nameController.clear();
      _mobileController.clear();
      _emailController.clear();
      _messageController.clear();
    });
  }
}
