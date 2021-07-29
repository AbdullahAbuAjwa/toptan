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
  void dispose() {
    super.dispose();
   // _messageController.dispose();
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
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: FutureBuilder(
                        future: chatProvider!
                            .fetchChat(Localizations.localeOf(context)),
                        builder: (ctx, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return loadingChat(context);
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'no_messages'.tr(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }
                          /*    return ListView.builder(
                              reverse: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (ctx, i) =>
                                  // data.items![i].userId == AppShared.currentUser!.user.id?
                                  snapshot.data.items![i].type == 0
                                      ? ChatCard(
                                          message:
                                              snapshot.data[i].message,
                                          sender:
                                              snapshot.data[i].sender,
                                          read: snapshot.data[i].read,
                                          time: snapshot.data[i].time,
                                          date: snapshot.data[i].date
                                              .toString()
                                              .substring(0, 10),
                                        )
                                      : ChatImageCard(
                                          message:
                                              snapshot.data.items![i].message,
                                          sender:
                                              snapshot.data.items![i].sender,
                                          time: snapshot.data.items![i].time,
                                          date: snapshot.data.items![i].date
                                              .toString()
                                              .substring(0, 10),
                                        )
                              // : Container(),
                              );*/
                          return Consumer<ChatProvider>(
                            builder: (BuildContext context, data,
                                    Widget? child) =>
                                data.items!.length == 0
                                    ? Center(
                                        child: Text(
                                          'no_messages'.tr(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        reverse: true,
                                        itemCount: data.items!.length,
                                        itemBuilder: (ctx, i) =>
                                            // data.items![i].userId == AppShared.currentUser!.user.id?
                                            data.items![i].type == 0
                                                ? ChatCard(
                                                    message:
                                                        data.items![i].message,
                                                    sender:
                                                        data.items![i].sender,
                                                    read: data.items![i].read,
                                                    time: data.items![i].time,
                                                    date: data.items![i].date
                                                        .toString()
                                                        .substring(0, 10),
                                                  )
                                                : ChatImageCard(
                                                    message:
                                                        data.items![i].message,
                                                    sender:
                                                        data.items![i].sender,
                                                    time: data.items![i].time,
                                                    date: data.items![i].date
                                                        .toString()
                                                        .substring(0, 10),
                                                  )
                                        // : Container(),
                                        ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 12),
                    child: imageFile == null
                        ? keyboardSend()
                        : keyboardSendImage(),
                  ),
                ],
              ),
              if (Provider.of<ChatProvider>(context).isLoading)
                CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  Widget keyboardSend() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0xffF3F4F7),
        ),
        padding: EdgeInsets.only(left: 5, bottom: 5),
        height: 60,
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
                  hintStyle: new TextStyle(color: Colors.grey, fontSize: 18),
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
                      child: Icon(Icons.photo),
                    ),
                    SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        sendMessage();
                      },
                      child: Icon(Icons.send),
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
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                SizedBox(width: 20),
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