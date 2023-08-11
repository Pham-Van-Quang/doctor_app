// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:doctor_app/authentication.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/common/back_button.dart';
import 'package:doctor_app/common/custom_button.dart';
import 'package:doctor_app/common/text_field.dart';
import 'package:doctor_app/view/personal_infor_update/view_model/personal_infor_update_cubit.dart';
import 'package:doctor_app/view/personal_infor_update/view_model/personal_infor_update_state.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PersonalInforUpdate extends StatefulWidget {
  const PersonalInforUpdate({super.key});

  @override
  State<PersonalInforUpdate> createState() => _PersonalInforUpdateState();
}

class _PersonalInforUpdateState extends State<PersonalInforUpdate> {
  late final _personalInforUpdateCubit =
      context.read<PersonalInforUpdateCubit>();

  @override
  void initState() {
    _personalInforUpdateCubit;
    _personalInforUpdateCubit.getProfilePicture();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInforUpdateCubit, PersonalInforUpdateState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 58, left: 18, right: 18, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackButtonCustom(
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 22),
                      Text('Cập nhật thông tin cá nhân',
                          style: Theme.of(context).textTheme.displayLarge),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(children: [
                            Container(
                              height: 124,
                              width: 124,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.13),
                                        blurRadius: 20)
                                  ]),
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(75),
                                child: state.currentPicture != null
                                    ? Image.file(
                                        File(state.currentPicture?.path ?? ""),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        state.uploadedFileURL ?? "",
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: CupertinoActionSheet(
                                            actions: <CupertinoActionSheetAction>[
                                              CupertinoActionSheetAction(
                                                isDefaultAction: true,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  _personalInforUpdateCubit
                                                      .pickImage();
                                                },
                                                child: Text(
                                                    'Chọn ảnh từ thư viện',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium),
                                              ),
                                              CupertinoActionSheetAction(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  _personalInforUpdateCubit
                                                      .pickImage(
                                                          isFromCamera: true);
                                                },
                                                child: Text(
                                                  'Chụp ảnh',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                            cancelButton:
                                                CupertinoButton.filled(
                                                    disabledColor:
                                                        const Color(0xffF52825),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Hủy",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                    )),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  height: 47,
                                  width: 47,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child:
                                      Image.asset('assets/images/camera.png'),
                                ),
                              ),
                            )
                          ]),
                        ],
                      ),
                      const SizedBox(height: 36),
                      const Text('Họ & Tên',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: kTextColor)),
                      const SizedBox(height: 15),
                      TextFieldCustom(
                        controller: _personalInforUpdateCubit.userName,
                        hintText: 'Nhập tên',
                        child: SvgPicture.asset('assets/icons/person.svg'),
                      ),
                      const SizedBox(height: 24),
                      const Text('Giới tính',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: kTextColor)),
                      const SizedBox(height: 15),
                      Column(
                        children: <Widget>[
                          RadioListTile(
                            title: const Text('Nam'),
                            value: Gender.male,
                            groupValue: state.gender,
                            onChanged: (value) {
                              _personalInforUpdateCubit.setGender(Gender.male);
                            },
                          ),
                          RadioListTile(
                            title: const Text('Nữ'),
                            value: Gender.female,
                            groupValue: state.gender,
                            onChanged: (value) {
                              _personalInforUpdateCubit
                                  .setGender(Gender.female);
                            },
                          ),
                          RadioListTile(
                              title: const Text('Khác'),
                              value: Gender.other,
                              groupValue: state.gender,
                              onChanged: (value) {
                                _personalInforUpdateCubit
                                    .setGender(Gender.other);
                              })
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text('Ngày sinh',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: kTextColor)),
                      const SizedBox(height: 15),
                      TextFieldCustom(
                        controller: _personalInforUpdateCubit.dateOfBirth,
                        hintText: 'Ngày sinh',
                        child:
                            SvgPicture.asset('assets/icons/date-of-birth.svg'),
                      ),
                      const SizedBox(height: 24),
                      const Text('Email',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: kTextColor)),
                      const SizedBox(height: 15),
                      TextFieldCustom(
                        controller: _personalInforUpdateCubit.email,
                        hintText: 'Email',
                        child: SvgPicture.asset('assets/icons/envelop.svg'),
                      ),
                      const SizedBox(height: 24),
                      const Text('Địa chỉ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: kTextColor)),
                      const SizedBox(height: 15),
                      TextFieldCustom(
                        controller: _personalInforUpdateCubit.address,
                        hintText: 'Nhập địa chỉ',
                        child: SvgPicture.asset('assets/icons/location.svg'),
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        onPressed: () async {
                          final storageRef = FirebaseStorage.instance.ref();
                          final profileImagesRef = storageRef.child(
                              "images/${Auth().currentUser?.email ?? ""}.jpg");
                          final uploadTask = await profileImagesRef
                              .putFile(File(state.currentPicture?.path ?? ""));
                          print('File Uploaded');
                          profileImagesRef.getDownloadURL().then((fileURL) {
                            state.uploadedFileURL;
                          });
                        },
                        child: Text("Cập nhật",
                            style: Theme.of(context).textTheme.displaySmall),
                      )
                    ])),
          ),
        );
      },
    );
  }
}
