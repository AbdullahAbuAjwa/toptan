import 'package:flutter/material.dart';
import 'package:toptan/Icons/custom_icon_icons.dart';
import 'package:toptan/Widgets/send_button.dart';

class CreatePOSScreen extends StatefulWidget {
  @override
  _CreatePOSScreenState createState() => _CreatePOSScreenState();
}

class _CreatePOSScreenState extends State<CreatePOSScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  var valueNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('Create POS'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 45),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 53,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      radius: 50,
                    ),
                  ),
                  Positioned(
                    top: 72,
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
                padding: const EdgeInsets.all(12.0),
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
                      SizedBox(height: 15),
                      TextFormField(
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
                      SizedBox(height: 15),
                      TextFormField(
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
                      SizedBox(height: 15),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(
                            CustomIcon.ic_security_locked,
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
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(6.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              hint: Text('Country'),
                              itemHeight: 50,
                              isExpanded: true,
                              icon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Color(0xff08A8FF),
                                size: 30,
                              ),
                              value: valueNumber,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Egypt'),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text('America'),
                                  value: 2,
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  valueNumber = value;
                                });
                              }),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: _addressController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Address',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(
                            CustomIcon.ic_contact_map_pin,
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                child: SendButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
