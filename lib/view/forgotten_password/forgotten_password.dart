// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:doctor_app/common/back_button.dart';
import 'package:doctor_app/common/text_field.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/common/custom_button.dart';
import 'package:doctor_app/view/forgotten_password/view_model/forgotten_password_cubit.dart';
import 'package:doctor_app/view/forgotten_password/view_model/forgotten_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:email_validator/email_validator.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  TextEditingController emailAddress = TextEditingController();
  String? emailAddressValue;

  @override
  void dispose() {
    emailAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgottenPasswordCubit, ForgottenPasswordState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 72.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonCustom(onTap: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(AppRouterName.login));
                }),
                SizedBox(height: 24.h),
                Text(
                  'Quên mật khẩu',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 16.h),
                Text('Nhập địa chỉ để cập nhật mật khẩu',
                    style: TextStyle(fontSize: 16.sp, color: kTextColor)),
                SizedBox(height: 122.h),
                _enterEmail(context, state),
                SizedBox(height: 26.h),
                _checkEmail(context)
              ],
            ),
          ),
        );
      },
    );
  }

  CustomButton _checkEmail(BuildContext context) {
    return CustomButton(
        onPressed: () {
          if (emailAddress.text.isEmpty) {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('Vui lòng nhập địa chỉ email.'),
                );
              },
            );
          } else {
            bool isEmailValid =
                EmailValidator.validate(emailAddress.text.trim());
            if (isEmailValid) {
              context
                  .read<ForgottenPasswordCubit>()
                  .resetPassword(emailAddress.text.trim());
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text(
                      'Đường dẫn đặt lại mật khẩu đã được gửi. Kiểm tra email!',
                    ),
                  );
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text('Địa chỉ email không hợp lệ.'),
                  );
                },
              );
            }
          }
        },
        child: Text('Đặt lại mật khẩu',
            style: Theme.of(context).textTheme.displaySmall));
  }

  TextFieldCustom _enterEmail(
      BuildContext context, ForgottenPasswordState state) {
    return TextFieldCustom(
      controller: emailAddress,
      onTap: () => context.read<ForgottenPasswordCubit>().isEmailFocused(),
      onChanged: (value) =>
          context.read<ForgottenPasswordCubit>().isEmailFocused(),
      hintText: 'Email',
      child: SvgPicture.asset('assets/icons/email.svg',
          color: state.isEmailFocused ? kTextColor : null),
    );
  }
}
