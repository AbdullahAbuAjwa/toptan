import 'package:flutter/material.dart';
import 'package:toptan/Icons/custom_icon_icons.dart';
import 'package:toptan/Widgets/send_button.dart';

class ServiceNameScreen extends StatefulWidget {
  @override
  _ServiceNameScreenState createState() => _ServiceNameScreenState();
}

class _ServiceNameScreenState extends State<ServiceNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        title: Text('Service Name'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff08A8FF),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(15),
              ),
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
                    'manager Name',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      color: const Color(0xff323b4a),
                      letterSpacing: 0.51,
                      fontWeight: FontWeight.w500,
                      height: 1.3529411764705883,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                trailing: Text(
                  '10/09/2019',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: const Color(0xff323b4a),
                    letterSpacing: 0.42,
                    height: 1.6428571428571428,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s'
                    'standard dummy text ever since the 1500s,',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: const Color(0xff445570),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mobile NO :',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: const Color(0xff323b4a),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '0000-0000-0000',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14,
                            color: const Color(0xff4a494b),
                          ),
                        ),
                        Icon(
                          CustomIcon.ic_contact_mobile,
                          color: Color(0xff08A8FF),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Photo ID :',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: const Color(0xff323b4a),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Icon(
                              CustomIcon.ic_devices_camera,
                              color: Color(0xff08A8FF),
                            ),
                            title: Text(
                              'Edit',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: const Color(0xff8d8d8d),
                                letterSpacing: 0.14400000000000002,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'image10001.jpg',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: const Color(0xff323b4a),
                              letterSpacing: 0.168,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Photo Sim card :',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: const Color(0xff323b4a),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Icon(
                              CustomIcon.ic_devices_camera,
                              color: Color(0xff08A8FF),
                            ),
                            title: Text(
                              'Edit',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: const Color(0xff8d8d8d),
                                letterSpacing: 0.14400000000000002,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'image10002.jpg',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: const Color(0xff323b4a),
                              letterSpacing: 0.168,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: const Color(0xff445570),
                        letterSpacing: 0.42,
                        height: 1.4285714285714286,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Package Name',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 17,
                            color: const Color(0xff445570),
                            letterSpacing: 0.51,
                            fontWeight: FontWeight.w500,
                            height: 1.3529411764705883,
                          ),
                        ),
                        Text(
                          '29\$',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            color: const Color(0xff08a8ff),
                            letterSpacing: 0.75,
                            height: 1.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          SendButton(),
        ],
      ),
    );
  }
}
