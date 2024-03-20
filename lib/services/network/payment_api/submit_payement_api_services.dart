import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/model/update_bank_details_model.dart';
import 'package:online_class_app/model/update_user_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubmitPaymentApiService extends BaseApiServices {
  Future submitPaymentApiServices(String txnId,String paymentId,String paymentImage) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      String? _userId = prefs.getString("id");


      FormData formData = FormData.fromMap({
        "txn_id": txnId,
        "payment_id": paymentId,
        "payment_image":await MultipartFile.fromFile(paymentImage),
      });


      var response = dio.post(uploadPaymentURL,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      responseJson = response;
    } on SocketException {
      print("No internet");
    }
    return responseJson;
  }
}
