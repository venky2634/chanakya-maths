import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPlansApiServices extends BaseApiServices {
  Future addPlanUser(String price, int planId) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
       int? stdId = prefs.getInt("std_id");
      var response = dio.post(addPlansUrl,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {"plan_id": planId, "price": price,"total_amount": price,"std_id":stdId});
      responseJson = response;
    } on SocketException {
      print("No internet");
    }
    return responseJson;
  }
}
