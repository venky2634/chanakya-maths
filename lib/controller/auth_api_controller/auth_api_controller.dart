import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/model/get_classlist_model.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/screen/Auth/Otp_screen.dart';
import 'package:online_class_app/services/network/auth_api_services/get_classlist_api_api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:online_class_app/services/network/auth_api_services/otp_api_servie.dart';
import 'package:online_class_app/services/network/auth_api_services/resend_otp_api_service.dart';
import 'package:online_class_app/services/network/auth_api_services/signup_api_service.dart';
import 'package:online_class_app/update_details/update_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  GetClassListApiServices getClassListApiServices = GetClassListApiServices();
  List<ClassListModel> classesList = [];
  RxBool isLoading = false.obs;
  getClassListUser() async {
    isLoading(true);
    dio.Response<dynamic> response =
        await getClassListApiServices.getClassListUser();
    isLoading(false);
    print(response.data);
    if (response.data["status"] == true) {
      ClassList classListModel = ClassList.fromJson(response.data);
      classesList = classListModel.data;
      update();
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data['message'],
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ));
    }
  }

  SignUpApiServices signUpApiServices = SignUpApiServices();
  // RxBool isLoading = false.obs;
  singUpUser(SignUp signUp) async {
    isLoading(true);
    dio.Response<dynamic> response = await signUpApiServices.signUpUser(signUp);
    isLoading(false);
    if (response.data["status"] == true) {
      Get.to(OtpValidation(mobile: signUp.mobile));
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          "Enter the 4 digits OTP",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
    }
  }

  SignUpOtpApiServices signUpOtpApiServices = SignUpOtpApiServices();

  signUpOtpUser(String mobile, String otp) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await signUpOtpApiServices.signUpOtpUser(mobile, otp);
    isLoading(false);
    print("----------------------------------------------------------");
    print(response.data);
    if (response.data["status"]) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', response.data['token']);
      Get.offAll(UpdatedDetails());
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data['message'],
            style: TextStyle(color: Colors.white, fontSize: 15),
          ));
    }
  }

  ResendOtpApiServices resendOtpApiServices = ResendOtpApiServices();
  reseneOtpUser(String mobile) async {
    dio.Response<dynamic> response =
        await resendOtpApiServices.resendOtpUser(mobile);
    print(response.data);
    if (response.data['status']) {
       final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data['token']);
    } else {
       Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data['message'],
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ));
    }
  }
}
