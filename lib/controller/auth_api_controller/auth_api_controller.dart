import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/model/get_classlist_model.dart';
import 'package:online_class_app/model/get_termfee_plan_model.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/model/update_bank_details_model.dart';
import 'package:online_class_app/model/update_user_model.dart';
import 'package:online_class_app/screen/Auth/Otp_screen.dart';
import 'package:online_class_app/screen/Payment/payment_choose_screen.dart';
import 'package:online_class_app/screen/BottomNavigation/bottom_navigation_screen.dart';
import 'package:online_class_app/services/network/auth_api_services/add_plans_api_service.dart';
import 'package:online_class_app/services/network/auth_api_services/get_classlist_api_api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:online_class_app/services/network/auth_api_services/get_plans_api_service.dart';
import 'package:online_class_app/services/network/auth_api_services/login_api_service.dart';
import 'package:online_class_app/services/network/auth_api_services/otp_api_servie.dart';
import 'package:online_class_app/services/network/auth_api_services/resend_otp_api_service.dart';
import 'package:online_class_app/services/network/auth_api_services/signup_api_service.dart';
import 'package:online_class_app/services/network/user_avilability/user_avilability_api_service.dart';
import 'package:online_class_app/update_details/update_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_class_app/services/network/auth_api_services/update_bank_details_api_services.dart';
import 'package:online_class_app/services/network/auth_api_services/update_user_data_api_services.dart';

import '../../screen/Payment/Payment_sucess_screen.dart';

class AuthController extends GetxController {
  GetClassListApiServices getClassListApiServices = GetClassListApiServices();
  List<ClassListModel> classesList = [];

  getClassListUser() async {
    isLoading(true);
    dio.Response<dynamic> response =
        await getClassListApiServices.getClassListUser();
    isLoading(false);
    print(",.>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
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
  RxBool isLoading = false.obs;
  singUpUser(SignUp signUp) async {
    isLoading(true);
    dio.Response<dynamic> response = await signUpApiServices.signUpUser(signUp);
    isLoading(false);
    if (response.data["status"] == true) {
      Get.offAll(OtpValidation(
        mobile: signUp.mobile,
      ));
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
  resendOtpUser(String mobile) async {
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

  LoginServicesApi loginServicesApi = LoginServicesApi();

  loginUser({required String username, required String password}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await loginServicesApi.loginApi(username: username, password: password);
    isLoading(false);
    if (response.data["status"] == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data["token"]);
      // await prefs.setString("user_id", response.data["user"]["id"]);
      await prefs.setString("verify", "true");
      Get.offAll(BottomNavigationScreen());
      print("------------------------>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(response.data);
      //  Get.find<ProfileController>().checkWhetherHeGo();
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data['message'],
            style: TextStyle(color: Colors.white, fontSize: 15),
          ));
    }
  }

  UpdateBankDetailsApiServices updateBankDetailsApiServices =
      UpdateBankDetailsApiServices();
  UpdateUserDataApiServices updateUserDataApiServices =
      UpdateUserDataApiServices();

  updateUserData(UpdateUserModel updateUserModel,
      UpdateBankDetailsModel updateBankDetailsModel) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await updateUserDataApiServices.updateUserData(updateUserModel);

    if (response.data["status"] == true) {
      updateBankDetails(updateBankDetailsModel);
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data['message'],
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
    }
  }

  updateBankDetails(UpdateBankDetailsModel updateBankDetailsModel) async {
    dio.Response<dynamic> response = await updateBankDetailsApiServices
        .updateBankDetails(updateBankDetailsModel);
    isLoading(false);
    if (response.data["status"] == true) {
      Get.offAll(PaymentChooseScreen());
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data['message'],
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
    }
  }

  RxBool isavilabe = false.obs;

  TextEditingController userNamecontroller = TextEditingController();

  UserAvilabilityServicesApi userAvilabilityServicesApi =
      UserAvilabilityServicesApi();

  Useravilability({
    required String username,
  }) async {
    dio.Response<dynamic> response =
        await userAvilabilityServicesApi.userAvilabilityApi(
      username: username,
    );

    if (response.data["status"] == true) {
      isavilabe(true);
    } else {
      isavilabe(false);
      print('user not avilable');
    }
    update();
  }

  GetPlanApiServices getPlanApiServices = GetPlanApiServices();

  List<TermfeePlanModel> termfeeList = [];

  getPlanUser() async {
    dio.Response<dynamic> response = await getPlanApiServices.getPlansUser();

    if (response.data["status"]) {
      TermfeePlan termfeePlan = TermfeePlan.fromJson(response.data);
      termfeeList = termfeePlan.data;

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

  AddPlansApiServices addPlansApiServices = AddPlansApiServices();

  addPlanUser(String price, int planId) async {
    dio.Response<dynamic> response =
        await addPlansApiServices.addPlanUser(price, planId);
    if (response.data["status"] == true) {
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          "Add plan sucessfully",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
      Get.offAll(PaymentSucessScreen());
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
