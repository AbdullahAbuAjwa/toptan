import 'package:flutter/material.dart';
import 'package:toptan/Icons/custom_icon_icons.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff08A8FF),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 45),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 63,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      radius: 60,
                    ),
                  ),
                  Positioned(
                    top: 82,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
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
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
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
                      SizedBox(height: 40),
                      TextFormField(
                        textInputAction: TextInputAction.done,
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
                      SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pushReplacementNamed(
                          //   'move_to_send_request_screen',
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(70.0),
                          ),
                          primary: Colors.white,
                          fixedSize: Size(250, 55),
                        ),
                        child: Text(
                          'EDIT PROFILE',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 16,
                            color: const Color(0xff08a8ff),
                            fontWeight: FontWeight.w700,
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
      ),
    );
  }
}
