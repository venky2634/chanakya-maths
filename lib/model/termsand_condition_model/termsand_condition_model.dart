// To parse this JSON data, do
//
//     final termsAndConditionModel = termsAndConditionModelFromJson(jsonString);

import 'dart:convert';

TermsAndConditionModel termsAndConditionModelFromJson(String str) => TermsAndConditionModel.fromJson(json.decode(str));

String termsAndConditionModelToJson(TermsAndConditionModel data) => json.encode(data.toJson());

class TermsAndConditionModel {
    bool? status;
    String? message;
    List<TermData> data;

    TermsAndConditionModel({
        this.status,
        this.message,
        required this.data,
    });

    factory TermsAndConditionModel.fromJson(Map<String, dynamic> json) => TermsAndConditionModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<TermData>.from(json["data"]!.map((x) => TermData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class TermData {
    int? id;
    String? content;

    TermData({
        this.id,
        this.content,
    });

    factory TermData.fromJson(Map<String, dynamic> json) => TermData(
        id: json["id"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
    };
}
