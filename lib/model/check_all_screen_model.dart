// To parse this JSON data, do
//
//     final checkAllScreenModel = checkAllScreenModelFromJson(jsonString);

import 'dart:convert';

CheckAllScreenModel checkAllScreenModelFromJson(String str) => CheckAllScreenModel.fromJson(json.decode(str));

String checkAllScreenModelToJson(CheckAllScreenModel data) => json.encode(data.toJson());

class CheckAllScreenModel {
    bool status;
    ScreensData screens;

    CheckAllScreenModel({
        required this.status,
        required this.screens,
    });

    factory CheckAllScreenModel.fromJson(Map<String, dynamic> json) => CheckAllScreenModel(
        status: json["status"],
        screens: ScreensData.fromJson(json["screens"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "screens": screens.toJson(),
    };
}

class ScreensData {
    bool schoolScreen;
    bool bankScreen;
    bool planScreen;
    bool isAdminApproved;

    ScreensData({
        required this.schoolScreen,
        required this.bankScreen,
        required this.planScreen,
        required this.isAdminApproved,
    });

    factory ScreensData.fromJson(Map<String, dynamic> json) => ScreensData(
        schoolScreen: json["school_screen"],
        bankScreen: json["bank_screen"],
        planScreen: json["plan_screen"],
        isAdminApproved: json["isAdminApproved"],
    );

    Map<String, dynamic> toJson() => {
        "school_screen": schoolScreen,
        "bank_screen": bankScreen,
        "plan_screen": planScreen,
    };
}
