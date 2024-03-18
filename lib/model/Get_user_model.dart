// To parse this JSON data, do
//
//     final getUserModel = getUserModelFromJson(jsonString);

import 'dart:convert';

GetUserModel getUserModelFromJson(String str) => GetUserModel.fromJson(json.decode(str));

String getUserModelToJson(GetUserModel data) => json.encode(data.toJson());

class GetUserModel {
    bool status;
    String message;
    UsersData data;

    GetUserModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
        status: json["status"],
        message: json["message"],
        data: UsersData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class UsersData {
    int id;
    String studentName;
    String username;
    String email;
    String mobile;
    String standardId;
    String schoolName;
    String gender;
    String place;
    String state;
    String fatherName;
    String fatherMobileNumber;
    String motherName;
    String motherMobileNumber;
    DateTime createdAt;
    String status;
    String isDeleted;
    dynamic referralCode;

    UsersData({
        required this.id,
        required this.studentName,
        required this.username,
        required this.email,
        required this.mobile,
        required this.standardId,
        required this.schoolName,
        required this.gender,
        required this.place,
        required this.state,
        required this.fatherName,
        required this.fatherMobileNumber,
        required this.motherName,
        required this.motherMobileNumber,
        required this.createdAt,
        required this.status,
        required this.isDeleted,
        required this.referralCode,
    });

    factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
        id: json["id"] ?? 0,
        studentName: json["student_name"] ?? "",
        username: json["username"]?? "",
        email: json["email"]?? "",
        mobile: json["mobile"]?? "",
        standardId: json["standard_id"]?? "",
        schoolName: json["school_name"]?? "",
        gender: json["gender"]?? "",
        place: json["place"]?? "",
        state: json["state"]?? "",
        fatherName: json["father_name"]?? "",
        fatherMobileNumber: json["father_mobile_number"]?? "",
        motherName: json["mother_name"]?? "",
        motherMobileNumber: json["mother_mobile_number"]?? "",
        createdAt: DateTime.parse(json["created_at"]),
        status: json["status"]?? "",
        isDeleted: json["is_deleted"]?? "",
        referralCode: json["referral_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student_name": studentName,
        "username": username,
        "email": email,
        "mobile": mobile,
        "standard_id": standardId,
        "school_name": schoolName,
        "gender": gender,
        "place": place,
        "state": state,
        "father_name": fatherName,
        "father_mobile_number": fatherMobileNumber,
        "mother_name": motherName,
        "mother_mobile_number": motherMobileNumber,
        "created_at": createdAt.toIso8601String(),
        "status": status,
        "is_deleted": isDeleted,
        "referral_code": referralCode,
    };
}
