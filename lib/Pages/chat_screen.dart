import 'package:flutter/material.dart';
import 'package:toptan/Widgets/chat_card.dart';
import 'package:toptan/Widgets/drawer.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Chat'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff08A8FF),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('move_to_notification_screen');
              },
              child: Icon(Icons.notifications_none_outlined),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    'assets/images/avatar.png',
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Pankaj joined the chat',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 18,
                      color: const Color(0xaf000000),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Text(
                    '2m ago',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 16,
                      color: const Color(0xff707070),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 500,
              child: ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: [
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
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color(0xffF3F4F7),
                                hintStyle: new TextStyle(
                                    color: Colors.grey, fontSize: 18),
                                hintText: "Write a replay…",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.emoji_emotions_outlined),
                              Icon(Icons.photo),
                              Icon(Icons.attach_file),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // child: TextField(
              //   textInputAction: TextInputAction.send,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
              //       borderSide: BorderSide(
              //         width: 1,
              //         style: BorderStyle.solid,
              //       ),
              //     ),
              //     suffix: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Icon(Icons.emoji_emotions_outlined),
              //         Icon(Icons.photo),
              //         Icon(Icons.attach_file),
              //       ],
              //     ),
              //     filled: true,
              //     fillColor: Color(0xffF3F4F7),
              //     hintStyle: new TextStyle(color: Colors.grey, fontSize: 18),
              //     hintText: "Write a replay…",
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
