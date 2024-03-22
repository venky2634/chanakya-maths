import 'dart:io';
import 'package:dio/dio.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';

class ForgetPasswordOtpApiServices extends BaseApiServices {
  Future forgetPasswordOtpUser(String mobile, String otp) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = dio.post(signUpOtpUrl,
          options: Options(
              headers: {'Content-Type': 'application/json'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "mobile": mobile,
            "otp": otp,
          });
      responseJson = response;
    } on SocketException {
      print("No internet");
    }
    return responseJson;
  }
}
