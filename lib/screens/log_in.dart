// ignore_for_file: avoid_print, deprecated_member_use, use_build_context_synchronously

import 'package:doctor_app/authentication.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/third_party.dart';

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
  bool isShowedPassWord = false;
  bool isEmailFocused = false;
  bool isLockFocused = false;
  SharedPreferences? prefs;

  @override
  void initState() {
    initSharedPref();
    emailAddress = TextEditingController(text: emailAdressValue);
    passWord = TextEditingController(text: passWordValue);
    super.initState();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
    final loginData = prefs?.getString("loginData");
    print(loginData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouterName.forgottenpassword);
                        },
                        child: const Text(
                          'Quên mật khẩu',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: kTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              fontFamily: 'SVN-Avo'),
                        )),
                  ],
                ),
                const SizedBox(height: 28),
                CustomButton(
                    onPressed: () async {
                      try {
                        await Auth().loginWithEmailAndPassword(
                            email: emailAddress.text.trim(),
                            password: passWord.text.trim());
                        Navigator.pushNamed(context, '/homepage');
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
                const SizedBox(height: 40),
                const Text(
                  'Hoặc',
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: 14,
                      fontFamily: 'SVN-Avo',
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 35),
                ThirdParty(),
                const SizedBox(height: 60),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: "Bạn chưa có tài khoản? ",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 14,
                        fontFamily: 'SVN-Avo',
                      )),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, AppRouterName.signup);
                        },
                      text: 'Đăng ký',
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontFamily: 'SVN-Avo',
                        decoration: TextDecoration.underline,
                      )),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
