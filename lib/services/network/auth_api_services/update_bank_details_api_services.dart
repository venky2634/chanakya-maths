import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/model/update_bank_details_model.dart';
import 'package:online_class_app/model/update_user_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateBankDetailsApiServices extends BaseApiServices {
  Future updateBankDetails(UpdateBankDetailsModel updateBankDetailsModel) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = dio.post(updateBankDetailURL,
          options: Options(
              headers: {
                 'Content-Type': 'application/json',
                 'Authorization': 'Bearer $authtoken',
                },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
    "bank_name":updateBankDetailsModel.bankName,
    "acc_holder_name":updateBankDetailsModel.accHolderName,
    "acc_related_to":updateBankDetailsModel.accRelatedTo
});
      responseJson = response;
    } on SocketException {
      print("No internet");
    }
    return responseJson;
  }
}
