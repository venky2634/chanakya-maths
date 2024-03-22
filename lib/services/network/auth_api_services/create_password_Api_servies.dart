import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';

class CreatePasswordApiServices extends BaseApiServices {
  Future createPasswordUser(String newPassword, String confirmPassword) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = dio.post(createPasswordUrl,
          options: Options(
              headers: {'Content-Type': 'application/json'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "userId": 1,
            "password": newPassword,
            "confirm_password": confirmPassword,
          });
      responseJson = response;
    } on SocketException {
      print("No internet");
    }
    return responseJson;
  }
}
