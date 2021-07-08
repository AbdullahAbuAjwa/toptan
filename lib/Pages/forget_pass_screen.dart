import 'package:flutter/material.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:easy_localization/easy_localization.dart';
class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    focusEmail.dispose();
  }

  //
  // Future<void> onTap(){
  //   if()
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        backgroundColor: Color(0xff08A8FF),
        elevation: 0,
        title: Text('forget_password'.tr()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Text(
              'Toptan',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 72,
                color: const Color(0x99000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 65),
            Text(
              'forget_password'.tr(),
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 28,
                color: const Color(0xff323b4a),
                letterSpacing: 0.336,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Make amazing and clean iOS 11 \nwireframes for your next app project.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0xff323b4a),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              height: 70,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  focusNode: focusEmail,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState(() {});
                      return 'enter_your_email'.tr();
                    }
                    if (!value.contains('@')) {
                      setState(() {});
                      return 'enter_valid_email'.tr();
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    suffixIcon: Icon(
                      CustomIcon.ic_contact_mail,
                      color: Color(0xff08A8FF),
                      size: 22,
                    ),
                    fillColor: Colors.white,
                    hintText: 'username@gmail.com',
                    hintStyle: TextStyle(
                      color: Color(0xff4A494B),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 65),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushReplacementNamed(
                    'move_to_reset_password_screen',
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                primary: Colors.white,
                fixedSize: Size(250, 55),
              ),
              child: Text(
                'send'.tr(),
                style: TextStyle(
                  color: Color(0xff08A8FF),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
