import 'package:doctor_app/view/privacy_and_term/items/privacy_and_term_header.dart';
import 'package:doctor_app/view/privacy_and_term/items/privacy_content.dart';
import 'package:doctor_app/view/privacy_and_term/items/term_content.dart';
import 'package:doctor_app/view/privacy_and_term/view_model/privacy_and_term_cubit.dart';
import 'package:doctor_app/view/privacy_and_term/view_model/privacy_and_term_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyAndTerm extends StatefulWidget {
  const PrivacyAndTerm({super.key});

  @override
  State<PrivacyAndTerm> createState() => _PrivacyAndTermState();
}

class _PrivacyAndTermState extends State<PrivacyAndTerm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyAndTermCubit, PrivacyAndTermState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 58.h),
              child: Column(
                children: [
                  PrivacyAndTermHeader(context),
                  SizedBox(height: 44.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'A. Điều khoản',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<PrivacyAndTermCubit>()
                                      .toggleTextA();
                                },
                                child: SvgPicture.asset(state.isShowedTextA
                                    ? 'assets/icons/show_arrow.svg'
                                    : 'assets/icons/hidden-arrow.svg'),
                              )
                            ],
                          ),
                          if (state.isShowedTextA) const TermContent(),
                          Padding(
                              padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                              child: Divider(
                                thickness: 1.h,
                                color: const Color(0xffABABAB).withOpacity(0.8),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('B. Chính sách',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<PrivacyAndTermCubit>()
                                      .toggleTextB();
                                },
                                child: SvgPicture.asset(state.isShowedTextB
                                    ? 'assets/icons/show_arrow.svg'
                                    : 'assets/icons/hidden-arrow.svg'),
                              )
                            ],
                          ),
                          if (state.isShowedTextB) const PrivacyContent(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
