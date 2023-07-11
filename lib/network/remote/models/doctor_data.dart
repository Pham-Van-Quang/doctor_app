import 'dart:convert';

class GetDoctorDataListItemResponse {
  final List<DoctorData> listDoctorData;
  final int responseCode;

  GetDoctorDataListItemResponse(
      {required this.listDoctorData, required this.responseCode});
}

class DoctorData {
  int? id;
  String? imageUrl;
  String? name;
  String? phoneNumber;
  String? email;
  String? speciality;
  String? year;
  String? university;
  String? department;
  String? award;

  DoctorData({
    this.id,
    this.imageUrl,
    this.name,
    this.phoneNumber,
    this.email,
    this.speciality,
    this.year,
    this.university,
    this.department,
    this.award,
  });

  DoctorData copyWith({
    int? id,
    String? name,
    String? imageUrl,
    String? phoneNumber,
    String? email,
    String? speciality,
    String? year,
    String? university,
    String? department,
    String? award,
  }) =>
      DoctorData(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        speciality: speciality ?? this.speciality,
        year: year ?? this.year,
        university: university ?? this.university,
        department: department ?? this.department,
        award: award ?? this.award,
      );

  factory DoctorData.fromRawJson(String str) =>
      DoctorData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorData.fromJson(Map<String, dynamic> json) => DoctorData(
        id: json["id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        speciality: json["speciality"],
        year: json["year"],
        university: json["university"],
        department: json["department"],
        award: json["award"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "speciality": speciality,
        "year": year,
        "university": university,
        "department": department,
        "award": award,
      };
}
