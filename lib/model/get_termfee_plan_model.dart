// To parse this JSON data, do
//
//     final termfeePlan = termfeePlanFromJson(jsonString);

import 'dart:convert';

TermfeePlan termfeePlanFromJson(String str) => TermfeePlan.fromJson(json.decode(str));

String termfeePlanToJson(TermfeePlan data) => json.encode(data.toJson());

class TermfeePlan {
    bool status;
    List<TermfeePlanModel> data;

    TermfeePlan({
        required this.status,
        required this.data,
    });

    factory TermfeePlan.fromJson(Map<String, dynamic> json) => TermfeePlan(
        status: json["status"],
        data: List<TermfeePlanModel>.from(json["data"].map((x) => TermfeePlanModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class TermfeePlanModel {
    int id;
    String title;
    String description;
    String price;
    String validTill;

    TermfeePlanModel({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.validTill,
    });

    factory TermfeePlanModel.fromJson(Map<String, dynamic> json) => TermfeePlanModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        validTill: json["valid_till"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "valid_till": validTill,
    };
}
