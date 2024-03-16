// To parse this JSON data, do
//
//     final classList = classListFromJson(jsonString);

import 'dart:convert';

ClassList classListFromJson(String str) => ClassList.fromJson(json.decode(str));

String classListToJson(ClassList data) => json.encode(data.toJson());

class ClassList {
  bool status;
  String message;
  List<ClassListModel> data;

  ClassList({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ClassList.fromJson(Map<String, dynamic> json) => ClassList(
        status: json["status"],
        message: json["message"],
        data: List<ClassListModel>.from(
            json["data"].map((x) => ClassListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ClassListModel {
  int id;
  String standard;

  ClassListModel({
    required this.id,
    required this.standard,
  });

  factory ClassListModel.fromJson(Map<String, dynamic> json) => ClassListModel(
        id: json["id"],
        standard: json["standard"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "standard": standard,
      };
}
