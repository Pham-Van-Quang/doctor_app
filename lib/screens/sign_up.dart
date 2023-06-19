// ignore_for_file: avoid_print, deprecated_member_use

import 'package:doctor_app/authentication.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_field.dart';
import '../widgets/third_party.dart';

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
    prefs = await SharedPreferences.getInstance();
    final signupData = prefs?.getString("signupData");
    print(signupData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 130, bottom: 74),
                    child: Image.asset('assets/images/logo.png', height: 125),
                  ),
                  TextFieldCustom(
                    controller: emailAddress,
                    onTap: () => setState(() {
                      isEmailFocused = true;
                    }),
                    onChanged: (value) => setState(() {
                      isEmailFocused = true;
                    }),
                    hintText: 'Email',
                    child: SvgPicture.asset('assets/icons/email.svg',
                        color: isEmailFocused ? kTextColor : null),
                  ),
                  const SizedBox(height: 16),
                  TextFieldCustom(
                    controller: passWord,
                    onTap: () => setState(() {
                      isLockFocused = true;
                    }),
                    onSubmitted: (value) => setState(() {
                      isLockFocused = false;
                    }),
                    obscureText: !isShowedPassWord,
                    hintText: 'Mật khẩu',
                    child: SvgPicture.asset('assets/icons/lock.svg',
                        color: isLockFocused ? kTextColor : null),
                    suffixIcon: InkWell(
                      onTap: () => setState(() {
                        isShowedPassWord = !isShowedPassWord;
                      }),
                      child: SizedBox(
                        width: 22,
                        child: Center(
                          child: SvgPicture.asset(
                            isShowedPassWord
                                ? 'assets/icons/open-eye.svg'
                                : 'assets/icons/hidden-eye.svg',
                            color: isShowedPassWord ? kTextColor : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        const TextSpan(
                          text: 'Bạn đã có tài khoản? ',
                          style: TextStyle(
                              fontSize: 14,
                              color: kTextColor,
                              fontFamily: 'SVN-Avo'),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, AppRouterName.login);
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
                  const SizedBox(height: 28),
                  CustomButton(
                      onPressed: () async {
                        await Auth().signupWithEmailAndPassword(
                            email: emailAddress.text.trim(),
                            password: passWord.text.trim());
                      },
                      child: Text("Đăng ký",
                          style: Theme.of(context).textTheme.displaySmall)),
                  const SizedBox(height: 40),
                  const Text(
                    'Đăng ký bằng',
                    style: TextStyle(color: kTextColor, fontSize: 14),
                  ),
                  const SizedBox(height: 35),
                  ThirdParty(),
                  const SizedBox(height: 64),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        const TextSpan(
                            text: 'Bằng cách đăng ký, bạn đồng ý với\n',
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                                fontFamily: 'SVN-Avo')),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, AppRouterName.privacyandterm);
                              },
                            text: 'Điều khoản & Chính sách',
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontFamily: 'SVN-Avo',
                                decoration: TextDecoration.underline))
                      ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
