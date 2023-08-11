// ignore_for_file: unused_local_variable

import 'package:doctor_app/authentication.dart';
import 'package:doctor_app/view/personal_infor_update/view_model/personal_infor_update_state.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInforUpdateCubit extends Cubit<PersonalInforUpdateState> {
  TextEditingController userName = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();

  PersonalInforUpdateCubit()
      : super(PersonalInforUpdateState(gender: Gender.male));

  void setGender(Gender newGender) {
    emit(state.copyWith(gender: newGender));
  }

  // void setCurrentPicture(XFile newPicture) {
  //   emit(state.copyWith(currentPicture: newPicture));
  // }

  // // Phương thức để lưu URL của hình ảnh đã tải lên
  // void setUploadedFileURL(String fileURL) {
  //   emit(state.copyWith(uploadedFileURL: fileURL));
  // }

  getProfilePicture() async {
    final storageRef = FirebaseStorage.instance.ref();
    final profileImagesRef =
        storageRef.child("images/${Auth().currentUser?.email ?? ""}.jpg");
    profileImagesRef.getDownloadURL().then((fileURL) {
      emit(state.copyWith(uploadedFileURL: fileURL));
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
    if (photo != null) {
      emit(state.copyWith(currentPicture: photo));
    }
    print(photo?.path);
  }
}
