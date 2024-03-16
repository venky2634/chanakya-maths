// To parse this JSON data, do
//
//     final updateUserModel = updateUserModelFromJson(jsonString);

import 'dart:convert';

UpdateUserModel updateUserModelFromJson(String str) => UpdateUserModel.fromJson(json.decode(str));

String updateUserModelToJson(UpdateUserModel data) => json.encode(data.toJson());

class UpdateUserModel {
    String schoolName;
    String gender;
    String place;
    String state;
    String fatherName;
    String fatherMobileNumber;
    String motherName;
    String motherMobileNumber;
    String studentName;

    UpdateUserModel({
        required this.schoolName,
        required this.gender,
        required this.place,
        required this.state,
        required this.fatherName,
        required this.fatherMobileNumber,
        required this.motherName,
        required this.motherMobileNumber,
        required this.studentName,
    });

    factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
        schoolName: json["school_name"],
        gender: json["gender"],
        place: json["place"],
        state: json["state"],
        fatherName: json["father_name"],
        fatherMobileNumber: json["father_mobile_number"],
        motherName: json["mother_name"],
        motherMobileNumber: json["mother_mobile_number"],
        studentName: json["student_name"],
    );

    Map<String, dynamic> toJson() => {
        "school_name": schoolName,
        "gender": gender,
        "place": place,
        "state": state,
        "father_name": fatherName,
        "father_mobile_number": fatherMobileNumber,
        "mother_name": motherName,
        "mother_mobile_number": motherMobileNumber,
        "student_name": studentName,
    };
}
