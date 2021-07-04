import 'package:flutter/material.dart';
import 'package:toptan/Icons/custom_icon_icons.dart';
import 'package:toptan/Widgets/drawer.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('About Us'),
        centerTitle: true,
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
                'Email',
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
                'Mobile',
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Name',
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your mobile';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Mobile',
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
                          controller: _addressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Message',
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
                          Navigator.of(context).pushReplacementNamed(
                            'move_to_home_screen',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          primary: Color(0xff08A8FF),
                          fixedSize: Size(250, 55),
                        ),
                        child: Text(
                          'SEND',
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
