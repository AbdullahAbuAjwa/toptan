import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:toptan/Helper/show_toast.dart';
import 'package:toptan/Pages/forget_pass_screen.dart';
import 'package:toptan/Provider/user_provider.dart';
import 'package:toptan/model/response/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  UserProvider? loginProvider;
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    loginProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0.r),
          topRight: Radius.circular(20.0.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 20.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 16.h),
                  child: Text(
                    'login'.tr(),
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 19.sp,
                      color: const Color(0xff08a8ff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x6ef3f4f7),
                    border: Border.all(
                      width: 1.w,
                      color: const Color(0xffe2e9f8),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0.h, horizontal: 8.w),
                            child: TextFormField(
                              controller: _emailController,
                              focusNode: _emailFocusNode,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter_your_email'.tr();
                                }
                                if (!value.contains('@')) {
                                  return 'enter_valid_email'.tr();
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'email'.tr(),
                                  hintText: 'email'.tr(),
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                  )),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 8.w),
                            child: TextFormField(
                              controller: _passwordController,
                              textInputAction: TextInputAction.done,
                              focusNode: _passwordFocusNode,
                              obscureText: obscurePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter_your_password'.tr();
                                }
                                if (value.length <= 5) {
                                  return 'password_more_than_five_character'
                                      .tr();
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'password'.tr(),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    obscurePassword = !obscurePassword;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    obscurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 24.sp,
                                  ),
                                ),
                                hintText: '*********',
                                hintStyle: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  height: 60.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75.r),
                    color: const Color(0xff08a8ff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x1c000000),
                        offset: Offset(0, 3),
                        blurRadius: 6.r,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    child: Text(
                      'login'.tr(),
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 18.sp,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      if (Provider.of<UserProvider>(context, listen: false)
                          .isLoading) return;
                      login();
                      setState(() {});
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                TextButton(
                  onPressed: () {
                    if (Provider.of<UserProvider>(context, listen: false)
                        .isLoading) return;
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: ForgetPasswordScreen()),
                    );
                  },
                  child: Text(
                    'forget_password'.tr(),
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 18.sp,
                      color: const Color(0xff626e89),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            if (Provider.of<UserProvider>(context).isLoading)
              Center(
                child: SpinKitDualRing(
                  color: Colors.blue,
                ),
              )
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    try {
      loginProvider!.isLoading = true;
      UserResponse? userResponse = await loginProvider!.signIn(
        Localizations.localeOf(context),
        email: _emailController.text,
        password: _passwordController.text,
      );
      loginProvider!.isLoading = false;
      if (userResponse.status) {
        ShowToast.showToast(
            'login_success'.tr(), MessageType.Success, Toast.LENGTH_SHORT);

        Navigator.pushReplacementNamed(context, 'move_to_home_screen');
      } else {
        ShowToast.showToast(
            userResponse.message, MessageType.Warning, Toast.LENGTH_LONG);
      }
    } catch (error) {
      loginProvider!.isLoading = false;
      print('error: ' + error.toString());
      throw (error);
    }
  }
}
