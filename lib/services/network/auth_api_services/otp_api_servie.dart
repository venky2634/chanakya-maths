import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';

class SignUpApiServices extends BaseApiServices {
  Future signUpUser(SignUp signUp) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = dio.post(singUpUrl,
          options: Options(
              headers: {'Content-Type': 'application/json'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "student_name": signUp.name,
            "username": signUp.userName,
            "email": signUp.email,
            "mobile": signUp.mobile,
            "std_id": 1,
            "password": signUp.password
          });
      responseJson = response;
    } on SocketException {
      print("No internet");
    }
    return responseJson;
  }
}
