import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ChatProvider>(context)
        .fetchChat(Localizations.localeOf(context));
  }

  @override
  Widget build(BuildContext context) {
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
                    : ListView.builder(
                        itemCount:
                            Provider.of<ChatProvider>(context).items!.length,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) =>
                            Provider.of<ChatProvider>(context)
                                        .items![index]
                                        .type ==
                                    0
                                ? ChatCard(Provider.of<ChatProvider>(context)
                                    .items![index])
                                : ChatImageCard(
                                    Provider.of<ChatProvider>(context)
                                        .items![index]),
                      ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 12.h),
                child: imageFile == null ? keyboardSend() : keyboardSendImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget keyboardSend() {
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
                        sendMessage();
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

  Widget keyboardSendImage() {
    return Container(
      color: Color(0xffF3F4F7),
      height: 140,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.file(
              imageFile,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.5,
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
                    sendMessage();
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

  Future<void> sendMessage() async {
    //if (_messageController.text.trim().isEmpty) return;
    MultipartFile? img;
    // chatProvider!.isLoading = true;
    try {
      FocusScope.of(context).unfocus();
      if (imageFile != null) {
        img = await MultipartFile.fromFile(imageFile!.path);
      }

      await chatProvider!.sendMessage(
        Localizations.localeOf(context),
        message: _messageController.text.trim(),
        image: img,
        type: 0,
      );
      // chatProvider!.isLoading = false;

      if (chatProvider!.chatResponse!.status) {
        _messageController.clear();
        imageFile = null;
        setState(() {});
      }
    } catch (error) {
      //chatProvider!.isLoading = false;
      print('error: ' + error.toString());
      throw (error);
    }
  }
}
