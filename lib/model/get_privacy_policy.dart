// To parse this JSON data, do
//
//     final getPrivacyPolicy = getPrivacyPolicyFromJson(jsonString);

import 'dart:convert';

GetPrivacyPolicy getPrivacyPolicyFromJson(String str) => GetPrivacyPolicy.fromJson(json.decode(str));

String getPrivacyPolicyToJson(GetPrivacyPolicy data) => json.encode(data.toJson());

class GetPrivacyPolicy {
    bool status;
    List<GetPrivaydatalist> data;

    GetPrivacyPolicy({
        required this.status,
        required this.data,
    });

    factory GetPrivacyPolicy.fromJson(Map<String, dynamic> json) => GetPrivacyPolicy(
        status: json["status"],
        data: List<GetPrivaydatalist>.from(json["data"].map((x) => GetPrivaydatalist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class GetPrivaydatalist {
    int id;
    String title;
    String description;

    GetPrivaydatalist({
        required this.id,
        required this.title,
        required this.description,
    });

    factory GetPrivaydatalist.fromJson(Map<String, dynamic> json) => GetPrivaydatalist(
        id: json["id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
    };
}
