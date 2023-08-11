import 'package:image_picker/image_picker.dart';

enum Gender { male, female, other }

class PersonalInforUpdateState {
  final Gender gender;
  final XFile? currentPicture;
  final String? uploadedFileURL;
  PersonalInforUpdateState({
    required this.gender,
    this.currentPicture,
    this.uploadedFileURL,
  });

  PersonalInforUpdateState copyWith({
    Gender? gender,
    XFile? currentPicture,
    String? uploadedFileURL,
  }) {
    return PersonalInforUpdateState(
      gender: gender ?? this.gender,
      currentPicture: currentPicture ?? this.currentPicture,
      uploadedFileURL: uploadedFileURL ?? this.uploadedFileURL,
    );
  }
}
