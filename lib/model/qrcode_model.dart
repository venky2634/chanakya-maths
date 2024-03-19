
// To parse this JSON data, do
//
//     final qrcode = qrcodeFromJson(jsonString);

import 'dart:convert';

Qrcode qrcodeFromJson(String str) => Qrcode.fromJson(json.decode(str));

String qrcodeToJson(Qrcode data) => json.encode(data.toJson());

class Qrcode {
    bool status;
    QrData data;
    String message;

    Qrcode({
        required this.status,
        required this.data,
        required this.message,
    });

    factory Qrcode.fromJson(Map<String, dynamic> json) => Qrcode(
        status: json["status"],
        data: QrData.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
    };
}

class QrData {
    String qrImage;
    PaymentData paymentData;

    QrData({
        required this.qrImage,
        required this.paymentData,
    });

    factory QrData.fromJson(Map<String, dynamic> json) => QrData(
        qrImage: json["qr_image"],
        paymentData: PaymentData.fromJson(json["paymentData"]),
    );

    Map<String, dynamic> toJson() => {
        "qr_image": qrImage,
        "paymentData": paymentData.toJson(),
    };
}

class PaymentData {
    int userId;
    String planId;
    String amount;
    String referenceId;
    int pinNumber;
    String upiLink;
    String qrLink;
    String status;
    DateTime createdAt;
    String txnStatus;
    String txnPayMode;
    DateTime updatedAt;
    int id;

    PaymentData({
        required this.userId,
        required this.planId,
        required this.amount,
        required this.referenceId,
        required this.pinNumber,
        required this.upiLink,
        required this.qrLink,
        required this.status,
        required this.createdAt,
        required this.txnStatus,
        required this.txnPayMode,
        required this.updatedAt,
        required this.id,
    });

    factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        userId: json["userId"],
        planId: json["planId"],
        amount: json["amount"],
        referenceId: json["referenceId"],
        pinNumber: json["pin_number"],
        upiLink: json["upi_link"],
        qrLink: json["qr_link"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        txnStatus: json["txn_status"],
        txnPayMode: json["txn_pay_mode"],
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "planId": planId,
        "amount": amount,
        "referenceId": referenceId,
        "pin_number": pinNumber,
        "upi_link": upiLink,
        "qr_link": qrLink,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "txn_status": txnStatus,
        "txn_pay_mode": txnPayMode,
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
    };
}
