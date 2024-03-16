// To parse this JSON data, do
//
//     final updateBankDetailsModel = updateBankDetailsModelFromJson(jsonString);

import 'dart:convert';

UpdateBankDetailsModel updateBankDetailsModelFromJson(String str) => UpdateBankDetailsModel.fromJson(json.decode(str));

String updateBankDetailsModelToJson(UpdateBankDetailsModel data) => json.encode(data.toJson());

class UpdateBankDetailsModel {
    String bankName;
    String accHolderName;
    String accRelatedTo;

    UpdateBankDetailsModel({
        required this.bankName,
        required this.accHolderName,
        required this.accRelatedTo,
    });

    factory UpdateBankDetailsModel.fromJson(Map<String, dynamic> json) => UpdateBankDetailsModel(
        bankName: json["bank_name"],
        accHolderName: json["acc_holder_name"],
        accRelatedTo: json["acc_related_to"],
    );

    Map<String, dynamic> toJson() => {
        "bank_name": bankName,
        "acc_holder_name": accHolderName,
        "acc_related_to": accRelatedTo,
    };
}
