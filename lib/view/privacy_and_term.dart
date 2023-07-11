import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/common/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyAndTerm extends StatefulWidget {
  const PrivacyAndTerm({super.key});

  @override
  State<PrivacyAndTerm> createState() => _PrivacyAndTermState();
}

class _PrivacyAndTermState extends State<PrivacyAndTerm> {
  bool isShowedTextA = false;
  bool isShowedTextB = false;
  String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 18, left: 18, top: 58),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonCustom(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Chính sách',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 40,
                    width: 40,
                  )
                ],
              ),
              const SizedBox(height: 44),
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
                              setState(() {
                                isShowedTextA = !isShowedTextA;
                              });
                            },
                            child: SvgPicture.asset(isShowedTextA
                                ? 'assets/icons/show_arrow.svg'
                                : 'assets/icons/hidden-arrow.svg'),
                          )
                        ],
                      ),
                      if (isShowedTextA)
                        Container(
                          margin: const EdgeInsets.only(top: 22, bottom: 24),
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 18,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            dummyText,
                            style: const TextStyle(
                                fontSize: 16,
                                color: kTextColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Divider(
                            thickness: 1,
                            color: const Color(0xffABABAB).withOpacity(0.8),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('B. Chính sách',
                              style: Theme.of(context).textTheme.bodyMedium),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isShowedTextB = !isShowedTextB;
                              });
                            },
                            child: SvgPicture.asset(isShowedTextB
                                ? 'assets/icons/show_arrow.svg'
                                : 'assets/icons/hidden-arrow.svg'),
                          )
                        ],
                      ),
                      if (isShowedTextB)
                        Container(
                          margin: const EdgeInsets.only(top: 22, bottom: 24),
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 18,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            dummyText,
                            style: const TextStyle(
                                fontSize: 15,
                                color: kTextColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
