import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/user_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  final _formKey = GlobalKey<FormState>();
  UserProvider? userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    focusEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: appBarApp('forget_password'.tr()),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Toptan',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 72.sp,
                    color: const Color(0x99000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 65.h),
                Text(
                  'forget_password'.tr(),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 27.sp,
                    color: const Color(0xff323b4a),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0.r)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        suffixIcon: Icon(
                          CustomIcon.ic_contact_mail,
                          color: Color(0xff08A8FF),
                          size: 20.sp,
                        ),
                        fillColor: Colors.white,
                        hintText: 'enter_your_email'.tr(),
                        hintStyle: TextStyle(
                            color: Color(0xff4A494B), fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 65.h),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    forgetPassword();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0.r),
                    ),
                    primary: Colors.white,
                    fixedSize: Size(250.w, 55.h),
                  ),
                  child: Text(
                    'send'.tr(),
                    style: TextStyle(
                      color: Color(0xff08A8FF),
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ],
            ),
            if (Provider.of<UserProvider>(context).isLoading)
              SpinKitDualRing(
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }

  Future forgetPassword() async {
    try {
      userProvider!.isLoading = true;

      await userProvider!.forgotPassword(Localizations.localeOf(context),
          email: emailController.text);
      userProvider!.isLoading = false;

      if (userProvider!.appResponse!.status) {
        ShowToast.showToast(userProvider!.appResponse!.message,
            MessageType.Success, Toast.LENGTH_LONG);
        Navigator.pop(context);
      } else {
        ShowToast.showToast(userProvider!.appResponse!.message,
            MessageType.Failed, Toast.LENGTH_SHORT);
      }
    } on Exception catch (e) {
      userProvider!.isLoading = false;

      print('ee: ' + e.toString());
    }
  }
}
