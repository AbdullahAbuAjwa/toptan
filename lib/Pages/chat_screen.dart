import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/cart_provider.dart';
import 'package:toptan/Provider/chat_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/chat_card.dart';
import 'package:toptan/Widgets/chat_image_card.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Widgets/loading_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  ChatProvider? chatProvider;
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
    super.initState();
    chatProvider = Provider.of<ChatProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ChatProvider>(context)
        .fetchChat(Localizations.localeOf(context));
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: AppDrawer(),
        appBar: appBarAppWithNotification('chat'.tr(), context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Provider.of<ChatProvider>(context).items!.length == 0
                    ? Center(child: loadingChat(context))
                    : Consumer<ChatProvider>(builder: (context, provider, _) {
                        return ListView.builder(
                          itemCount: provider.items!.length,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          reverse: true,
                          itemBuilder: (context, index) =>
                              provider.items![index].type == 0
                                  ? ChatCard(provider.items![index])
                                  : ChatImageCard(provider.items![index]),
                        );
                      }),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 12.h),
                child: imageFile == null
                    ? keyboardSend(context)
                    : keyboardSendImage(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget keyboardSend(context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: Color(0xffF3F4F7),
        ),
        padding: EdgeInsets.only(left: 5.w, bottom: 7.h),
        height: 60.h,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: TextField(
                controller: _messageController,
                autofocus: false,
                textInputAction: TextInputAction.newline,
                maxLines: 40,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffF3F4F7),
                  hintStyle: new TextStyle(color: Colors.grey, fontSize: 18.sp),
                  hintText: "write_reply".tr(),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Icon(
                        Icons.photo,
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    InkWell(
                      onTap: () {
                        sendMessage(context);
                      },
                      child: Icon(
                        Icons.send,
                        size: 24.sp,
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  Widget keyboardSendImage(context) {
    return Container(
      color: Color(0xffF3F4F7),
      height: 150.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7.r),
              child: Image.file(
                imageFile,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height * 0.38,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Icon(Icons.photo),
                ),
                SizedBox(width: 20.w),
                InkWell(
                  onTap: () {
                    sendImageMessage(context);
                  },
                  child: Icon(Icons.send),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendImageMessage(context) async {
    try {
      //    Provider.of<CartProvider>(context).isLoading = true;
      MultipartFile? img;
      if (imageFile != null) {
        img = await MultipartFile.fromFile(imageFile!.path);
        await chatProvider!.sendMessage(
          Localizations.localeOf(context),
          message: ' ',
          image: img,
          type: 1,
        );

        //Provider.of<CartProvider>(context).isLoading = false;
      }
      if (chatProvider!.chatResponse!.status) {
        imageFile = null;
      } else {
        print(chatProvider!.chatResponse!.message);
      }
    } on Exception catch (e) {
      // Provider.of<CartProvider>(context).isLoading = false;
      print('eeee: ' + e.toString());
    }
  }

  Future<void> sendMessage(context) async {
    if (_messageController.text.trim().isEmpty) return;
    try {
      //  FocusScope.of(context).unfocus();
      await chatProvider!.sendMessage(
        Localizations.localeOf(context),
        message: _messageController.text.trim(),
        type: 0,
      );
      if (chatProvider!.chatResponse!.status) {
        _messageController.clear();
      } else {
        print(chatProvider!.chatResponse!.message);
      }
    } catch (error) {
      print('error: ' + error.toString());
      throw (error);
    }
  }
}
