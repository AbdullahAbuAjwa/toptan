import 'package:flutter/material.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
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
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('contact_us').tr(),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0,left: 12),
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
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ListView(
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
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: _nameController,
                        focusNode: _nameFocusNode,
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
                    ),
                    SizedBox(height: 15),
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter_your_email';
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
                    ),
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        controller: _mobileController,
                        focusNode: _mobileFocusNode,
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
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 150,
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          controller: _messageController,
                          focusNode: _messageFocusNode,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter_your_message'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'message'.tr(),
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
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushReplacementNamed(
                              'move_to_home_screen',
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          primary: Color(0xff08A8FF),
                          fixedSize: Size(250, 55),
                        ),
                        child: Text(
                          'send'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
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
    );
  }
}
