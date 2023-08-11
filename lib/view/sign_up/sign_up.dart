// ignore_for_file: avoid_print, deprecated_member_use, use_build_context_synchronously

import 'package:doctor_app/authentication.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/view/sign_up/view_model/sign_up_cubit.dart';
import 'package:doctor_app/view/sign_up/view_model/sign_up_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/constants.dart';
import '../../common/custom_button.dart';
import '../../common/text_field.dart';
import '../../common/third_party.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController passWord = TextEditingController();
  String? emailAddressValue;
  String? passWordValue;
  bool isShowedPassWord = false;
  bool isEmailFocused = false;
  bool isLockFocused = false;
  SharedPreferences? prefs;

  @override
  void initState() {
    initSharedPref();
    emailAddress = TextEditingController(text: emailAddressValue);
    passWord = TextEditingController(text: passWordValue);
    super.initState();
  }

  void initSharedPref() async {
    context.read<SignupCubit>().initSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 130.h, bottom: 74.h),
                        child: Image.asset('assets/images/logo.png',
                            height: 125.h),
                      ),
                      TextFieldCustom(
                        controller: emailAddress,
                        onTap: () =>
                            context.read<SignupCubit>().isEmailFocused(),
                        onChanged: (value) =>
                            context.read<SignupCubit>().isEmailFocused(),
                        hintText: 'Email',
                        child: SvgPicture.asset('assets/icons/email.svg',
                            color: state.isEmailFocused ? kTextColor : null),
                      ),
                      SizedBox(height: 16.h),
                      TextFieldCustom(
                        controller: passWord,
                        onTap: () =>
                            context.read<SignupCubit>().isLockFocused(),
                        onSubmitted: (value) =>
                            context.read<SignupCubit>().isLockFocused(),
                        obscureText: !state.isShowedPassWord,
                        hintText: 'Mật khẩu',
                        suffixIcon: InkWell(
                          onTap: () =>
                              context.read<SignupCubit>().isShowedPassWord(),
                          child: SizedBox(
                            width: 22,
                            child: Center(
                              child: SvgPicture.asset(
                                state.isShowedPassWord
                                    ? 'assets/icons/open-eye.svg'
                                    : 'assets/icons/hidden-eye.svg',
                                color:
                                    state.isShowedPassWord ? kTextColor : null,
                              ),
                            ),
                          ),
                        ),
                        child: SvgPicture.asset('assets/icons/lock.svg',
                            color: state.isLockFocused ? kTextColor : null),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: 'Bạn đã có tài khoản? ',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: kTextColor,
                                  fontFamily: 'SVN-Avo'),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, AppRouterName.login);
                                },
                              text: 'Đăng nhập',
                              style: const TextStyle(
                                  fontFamily: 'SVN-Avo',
                                  decoration: TextDecoration.underline,
                                  color: kPrimaryColor),
                            )
                          ]))
                        ],
                      ),
                      SizedBox(height: 26.h),
                      CustomButton(
                          onPressed: () async {
                            await Auth().signupWithEmailAndPassword(
                                email: emailAddress.text.trim(),
                                password: passWord.text.trim());
                            Navigator.pushNamed(
                                context, AppRouterName.successfulregistration);
                          },
                          child: Text("Đăng ký",
                              style: Theme.of(context).textTheme.displaySmall)),
                      SizedBox(height: 44.h),
                      Text(
                        'Đăng ký bằng',
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 34.h),
                      ThirdParty(),
                      SizedBox(height: 62.h),
                      Text(
                        'Bằng cách đăng ký, bạn đồng ý với\n Điều khoản & Chính sách',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 14.sp,
                            fontFamily: 'SVN-Avo',
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
