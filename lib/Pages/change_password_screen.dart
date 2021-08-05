import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Provider/user_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toptan/Widgets/button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  final _oldPasswordFocusNode = FocusNode();
  final _newPasswordFocusNode = FocusNode();
  final _confirmNewPasswordFocusNode = FocusNode();
  UserProvider? userProvider;
  bool obscureOldPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _oldPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmNewPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp('change_password'.tr()),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 60.h, horizontal: 10.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _oldPasswordController,
                          focusNode: _oldPasswordFocusNode,
                          obscureText: obscureOldPassword,
                          decoration: InputDecoration(
                            hintText: 'old_password'.tr(),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                obscureOldPassword = !obscureOldPassword;
                                setState(() {});
                              },
                              child: Icon(
                                obscureOldPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 24.sp,
                              ),
                            ),
                            hintStyle: TextStyle(fontSize: 17.sp),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0.r)),
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _newPasswordController,
                          focusNode: _newPasswordFocusNode,
                          obscureText: obscureNewPassword,
                          decoration: InputDecoration(
                            hintText: 'new_password'.tr(),
                            filled: true,
                            hintStyle: TextStyle(fontSize: 17.sp),
                            fillColor: Colors.white,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                obscureNewPassword = !obscureNewPassword;
                                setState(() {});
                              },
                              child: Icon(
                                obscureNewPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 24.sp,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.r)),
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: _confirmNewPasswordController,
                          focusNode: _confirmNewPasswordFocusNode,
                          obscureText: obscureConfirmPassword,
                          decoration: InputDecoration(
                            hintText: 'confirm_new_password'.tr(),
                            filled: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                obscureConfirmPassword =
                                    !obscureConfirmPassword;
                                setState(() {});
                              },
                              child: Icon(
                                obscureConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 24.sp,
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 17.sp,
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(
                                width: 1,
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
                  padding: EdgeInsets.only(top: 8.h, bottom: 12.0.h),
                  child: ButtonSend(
                    onTap: () {
                      changePassword();
                    },
                    text: 'change_password'.tr(),
                    textColor: Colors.white,
                    buttonColor: Color(0xff08A8FF),
                  ),
                ),
              ],
            ),
            if (Provider.of<UserProvider>(context, listen: false).isLoading)
              CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  Future<void> changePassword() async {
    try {
      userProvider!.isLoading = true;
      await userProvider!.changePassword(
        Localizations.localeOf(context),
        oldPassword: _oldPasswordController.text.trim(),
        newPassword: _newPasswordController.text.trim(),
        confirmPassword: _confirmNewPasswordController.text.trim(),
      );
      userProvider!.isLoading = false;
      if (userProvider!.appResponse!.status) {
        ShowToast.showToast(
            userProvider!.appResponse!.message, MessageType.Success,Toast.LENGTH_SHORT);
        Navigator.pop(context);
      } else {
        ShowToast.showToast(userProvider!.appResponse!.message,
            MessageType.Warning, Toast.LENGTH_LONG);
      }
    } catch (error) {
      userProvider!.isLoading = false;
      print('error: ' + error.toString());
      throw (error);
    }
  }
}
