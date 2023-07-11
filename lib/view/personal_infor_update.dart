// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:doctor_app/view/authentication.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/common/back_button.dart';
import 'package:doctor_app/common/custom_button.dart';
import 'package:doctor_app/common/text_field.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

enum Gender { male, female, other }

class PersonalInforUpdate extends StatefulWidget {
  const PersonalInforUpdate({super.key});

  @override
  State<PersonalInforUpdate> createState() => _PersonalInforUpdateState();
}

class _PersonalInforUpdateState extends State<PersonalInforUpdate> {
  XFile? currentPicture;
  final storage = FirebaseStorage.instance;
  String? uploadedFileURL;
  Gender _gender = Gender.male;

  @override
  void initState() {
    getProfilePicture();
    super.initState();
  }

  getProfilePicture() async {
    final storageRef = FirebaseStorage.instance.ref();
    final profileImagesRef =
        storageRef.child("images/${Auth().currentUser?.email ?? ""}.jpg");

    profileImagesRef.getDownloadURL().then((fileURL) {
      setState(() {
        uploadedFileURL = fileURL;
      });
      Auth().updateUserPhoto(fileURL);
    });
  }

  pickImage({bool isFromCamera = false}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo;

    final storage = FirebaseStorage.instance;
    if (isFromCamera) {
      photo = await picker.pickImage(source: ImageSource.camera);
    } else {
      photo = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      currentPicture = photo;
    });
    print(photo?.path);
  }

  TextEditingController userName = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(top: 58, left: 18, right: 18, bottom: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        child: currentPicture != null
                            ? Image.file(
                                File(currentPicture?.path ?? ""),
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                uploadedFileURL ?? "",
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
                                          pickImage();
                                        },
                                        child: Text('Chọn ảnh từ thư viện',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                      ),
                                      CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          pickImage(isFromCamera: true);
                                        },
                                        child: Text(
                                          'Chụp ảnh',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                    cancelButton: CupertinoButton.filled(
                                        disabledColor: const Color(0xffF52825),
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
                          child: Image.asset('assets/images/camera.png'),
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
                controller: userName,
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
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Nữ'),
                    value: Gender.female,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  RadioListTile(
                      title: const Text('Khác'),
                      value: Gender.other,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
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
                controller: dateOfBirth,
                hintText: 'Ngày sinh',
                child: SvgPicture.asset('assets/icons/date-of-birth.svg'),
              ),
              const SizedBox(height: 24),
              const Text('Email',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: kTextColor)),
              const SizedBox(height: 15),
              TextFieldCustom(
                controller: email,
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
                controller: address,
                hintText: 'Nhập địa chỉ',
                child: SvgPicture.asset('assets/icons/location.svg'),
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () async {
                  final storageRef = FirebaseStorage.instance.ref();
                  final profileImagesRef = storageRef
                      .child("images/${Auth().currentUser?.email ?? ""}.jpg");
                  final uploadTask = await profileImagesRef
                      .putFile(File(currentPicture?.path ?? ""));
                  print('File Uploaded');
                  profileImagesRef.getDownloadURL().then((fileURL) {
                    setState(() {
                      uploadedFileURL = fileURL;
                    });
                  });
                },
                child: Text("Cập nhật",
                    style: Theme.of(context).textTheme.displaySmall),
              )
            ])),
      ),
    );
  }
}
