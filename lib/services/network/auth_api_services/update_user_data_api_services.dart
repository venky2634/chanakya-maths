import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/model/update_user_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateUserDataApiServices extends BaseApiServices {
  Future updateUserData(UpdateUserModel updateUserModel) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      var response = dio.post(updateUserDetailsURL,
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
          "school_name": updateUserModel.schoolName,
          "gender":  updateUserModel.gender,
          "place": updateUserModel.place,
          "state": updateUserModel.state,
          "father_name": updateUserModel.fatherName,
          "father_mobile_number": updateUserModel.fatherMobileNumber,
          "mother_name": updateUserModel.motherName,
          "mother_mobile_number": updateUserModel.motherMobileNumber,
          });
      responseJson = response;
    } on SocketException {
      print("No internet");
    }
    return responseJson;
  }
}
