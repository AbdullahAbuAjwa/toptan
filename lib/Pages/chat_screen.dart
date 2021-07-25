import 'package:flutter/material.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/chat_card.dart';
import 'package:toptan/Widgets/drawer.dart';
import 'package:easy_localization/easy_localization.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _messageController.dispose();
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
                child: ListView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ChatCard(
                      time: '11/10/2020',
                      message: 'MESSAGE',
                      isMe: false,
                      delivered: true,
                    ),
                    ChatCard(
                      time: '11/10/2020',
                      message: 'MESSAGE',
                      isMe: true,
                      delivered: true,
                    ),
                    ChatCard(
                      time: '11/10/2020',
                      message: 'MESSAGE',
                      isMe: true,
                      delivered: true,
                    ),
                    ChatCard(
                      time: '11/10/2020',
                      message: 'MESSAGE',
                      isMe: false,
                      delivered: false,
                    ),
                    ChatCard(
                      time: '11/10/2020',
                      message: 'MESSAGE',
                      isMe: true,
                      delivered: true,
                    ),
                    ChatCard(
                      time: '11/10/2020',
                      message: 'MESSAGE',
                      isMe: true,
                      delivered: true,
                    ),
                    ChatCard(
                      time: '11/10/2020',
                      message: 'MESSAGE',
                      isMe: true,
                      delivered: true,
                    ),
                    ChatCard(
                      time: '11/10/2020',
                      message: 'MESSAGE',
                      isMe: true,
                      delivered: true,
                    ),
                    ChatCard(
                      time: '11/10/2020',
                      message: 'MESSAGE',
                      isMe: false,
                      delivered: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
                child: Container(
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
                            hintStyle:
                                new TextStyle(color: Colors.grey, fontSize: 18),
                            hintText: "write_reply".tr(),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(Icons.photo),
                              ),
                              SizedBox(width: 12),
                              InkWell(
                                onTap: () {},
                                child: Icon(Icons.send),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
