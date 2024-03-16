import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/model/get_classlist_model.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/screen/Auth/Otp_screen.dart';
import 'package:online_class_app/services/network/auth_api_services/get_classlist_api_api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:online_class_app/services/network/auth_api_services/signup_api_service.dart';

class AuthController extends GetxController {
  GetClassListApiServices getClassListApiServices = GetClassListApiServices();
  List<ClassListModel> classesList = [];

  getClassListUser() async {
    dio.Response<dynamic> response =
        await getClassListApiServices.getClassListUser();
    print(response.data);
    if (response.data["status"] == true) {
      ClassList classListModel = ClassList.fromJson(response.data);
      classesList = classListModel.data;
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
  RxBool isLoading = false.obs;
  singUpUser(SignUp signUp) async {
    isLoading(true);
    dio.Response<dynamic> response = await signUpApiServices.signUpUser(signUp);
    isLoading(true);
    if (response.data["status"] == true) {
      Get.to(OtpValidation());
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
}
