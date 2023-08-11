// ignore_for_file: avoid_print, deprecated_member_use, use_build_context_synchronously

import 'package:doctor_app/authentication.dart';
import 'package:doctor_app/common/custom_button.dart';
import 'package:doctor_app/common/third_party.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/common/text_field.dart';
import 'package:doctor_app/view/log_in/view_model/log_in_cubit.dart';
import 'package:doctor_app/view/log_in/view_model/log_in_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  const Login({super.key, required String title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController passWord = TextEditingController();
  String? emailAdressValue;
  String? passWordValue;

  @override
  void initState() {
    initSharedPref();
    emailAddress = TextEditingController(text: emailAdressValue);
    passWord = TextEditingController(text: passWordValue);
    super.initState();
  }

  void initSharedPref() async {
    context.read<LoginCubit>().initSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 130.h, bottom: 74.h),
                      child:
                          Image.asset('assets/images/logo.png', height: 125.h),
                    ),
                    TextFieldCustom(
                      controller: emailAddress,
                      onTap: () => context.read<LoginCubit>().isEmailFocused(),
                      onChanged: (value) =>
                          context.read<LoginCubit>().isEmailFocused(),
                      hintText: 'Email',
                      child: SvgPicture.asset('assets/icons/email.svg',
                          color: state.isEmailFocused ? kTextColor : null),
                    ),
                    SizedBox(height: 16.h),
                    TextFieldCustom(
                      controller: passWord,
                      onTap: () => context.read<LoginCubit>().isLockFocused(),
                      onSubmitted: (value) =>
                          context.read<LoginCubit>().isLockFocused(),
                      obscureText: !state.isShowedPassWord,
                      hintText: 'Mật khẩu',
                      suffixIcon: InkWell(
                        onTap: () =>
                            context.read<LoginCubit>().isShowedPassWord(),
                        child: SizedBox(
                          width: 22.w,
                          child: Center(
                            child: SvgPicture.asset(
                              state.isShowedPassWord
                                  ? 'assets/icons/open-eye.svg'
                                  : 'assets/icons/hidden-eye.svg',
                              color: state.isShowedPassWord ? kTextColor : null,
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
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouterName.forgottenpassword);
                            },
                            child: Text(
                              'Quên mật khẩu',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: kTextColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                  fontFamily: 'SVN-Avo'),
                            )),
                      ],
                    ),
                    SizedBox(height: 28.h),
                    CustomButton(
                        onPressed: () async {
                          try {
                            await Auth().loginWithEmailAndPassword(
                                email: emailAddress.text.trim(),
                                password: passWord.text.trim());
                            Navigator.pushNamed(
                                context, AppRouterName.homepage);
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Center(
                                        child: Text('Thông báo',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium),
                                      ),
                                      content: const Text(
                                          'Email hoặc mật khẩu không đúng\nVui lòng thử lại!'),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: kPrimaryColor),
                                            child: const Text('Đồng ý'))
                                      ],
                                    ));
                          }
                        },
                        child: Text("Đăng nhập",
                            style: Theme.of(context).textTheme.displaySmall)),
                    SizedBox(height: 40.h),
                    Text(
                      'Hoặc',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 14.sp,
                          fontFamily: 'SVN-Avo',
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 35.h),
                    ThirdParty(
                      onTap: () {},
                      onPressed: () async {
                        await Auth().signInWithGoogle();
                        Navigator.pushNamed(context, AppRouterName.homepage);
                      },
                    ),
                    SizedBox(height: 68.h),
                    _textBottom(context)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  RichText _textBottom(BuildContext context) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: "Bạn chưa có tài khoản? ",
          style: TextStyle(
            color: kTextColor,
            fontSize: 14.sp,
            fontFamily: 'SVN-Avo',
          )),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushNamed(context, AppRouterName.signup);
            },
          text: 'Đăng ký',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 14.sp,
            fontFamily: 'SVN-Avo',
            decoration: TextDecoration.underline,
          )),
    ]));
  }
}
