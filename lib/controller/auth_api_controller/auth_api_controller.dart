import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/model/check_all_screen_model.dart';
import 'package:online_class_app/model/get_classlist_model.dart';
import 'package:online_class_app/model/get_termfee_plan_model.dart';
import 'package:online_class_app/model/qrcode_model.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/model/update_bank_details_model.dart';
import 'package:online_class_app/model/update_user_model.dart';
import 'package:online_class_app/screen/Auth/Otp_screen.dart';
import 'package:online_class_app/screen/Auth/signin_screen.dart';
import 'package:online_class_app/screen/BottomNavigation/Settings/pending_approval_screen.dart';
import 'package:online_class_app/services/network/auth_api_services/payment_option_api_services.dart';
import 'package:online_class_app/services/network/payment_api/submit_payement_api_services.dart';
import 'package:online_class_app/update_details/metion_details.dart';
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
import 'package:online_class_app/services/network/validation_api_services/check_all_filled_up_api_services.dart';
import 'package:online_class_app/update_details/update_bank_details_n_check.dart';
import 'package:online_class_app/update_details/update_details.dart';
import 'package:online_class_app/update_details/update_user_details_on_check.dart';
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
      await prefs.setString('id', response.data['data']['user_id'].toString());
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
    // isLoading(false);
    if (response.data["status"] == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data["token"]);
      await prefs.setString('id', response.data['data']['user_id'].toString());
      // await prefs.setString("user_id", response.data["user"]["id"]);
      await prefs.setString("verify", "true");
      Get.find<AuthController>().checkIsUserFilledAllScreens();
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
            style: const TextStyle(color: Colors.white, fontSize: 15),
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
      Get.offAll(const PaymentChooseScreen());
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


  updateUserDataOnLater(UpdateUserModel updateUserModel) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await updateUserDataApiServices.updateUserData(updateUserModel);

    if (response.data["status"] == true) {
      // updateBankDetails(updateBankDetailsModel);
      checkIsUserFilledAllScreens();
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

  updateBankDetailsOnLater(
      UpdateBankDetailsModel updateBankDetailsModel) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateBankDetailsApiServices
        .updateBankDetails(updateBankDetailsModel);

    if (response.data["status"] == true) {
      checkIsUserFilledAllScreens();
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

  CheckAllFilledUpApiServices checkAllFilledUpApiServices =
      CheckAllFilledUpApiServices();

  checkIsUserFilledAllScreens() async {
    isLoading(true);
    dio.Response<dynamic> response =
        await checkAllFilledUpApiServices.checkAllFilledUp();
    isLoading(false);
    if (response.data["status"] == true) {
      CheckAllScreenModel checkAllScreenModel =
          CheckAllScreenModel.fromJson(response.data);

      if (checkAllScreenModel.screens.schoolScreen == false) {
        Get.offAll(() => UpdateUserDetailsOnLater());
      } else if (checkAllScreenModel.screens.bankScreen == false) {
        Get.offAll(() => UpdateBanlDetailsOnLater());
      } else if (checkAllScreenModel.screens.planScreen == false) {
        Get.offAll(() => PaymentChooseScreen());
      } else {
        Get.offAll(BottomNavigationScreen());
      }
    } else {
      if (response.data["status"] == "Token is Expired") {
        logoutUser();
      }
    }
  }

  logoutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', "null");
    Get.offAll(() => SignScreen());
  }

  PaymentOptionApiService paymentOptionApiService = PaymentOptionApiService();

  QrData? qrCodeData;

  paymentOptionUser(String userId, String planId) async {
    dio.Response<dynamic> response =
        await paymentOptionApiService.paymentOptionUser(userId, planId);
    print(response.data);
    if (response.data["status"] == true) {
      Qrcode qrcode = Qrcode.fromJson(response.data);
      qrCodeData = qrcode.data;
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

  SubmitPaymentApiService submitPaymentApiService = SubmitPaymentApiService();

  submitPaymentDetails({
    required String txnId,
    required String paymentId,
    required int planId,
    required String price,
    required String paymentImage,
  }) async{
    isLoading(true);
   dio.Response<dynamic> response = await submitPaymentApiService.submitPaymentApiServices(txnId, paymentId, paymentImage);
    isLoading(false);
   
   if (response.data["status"] == true) {
      

     addPlanUser( price,  planId);
        Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ));
     
   }else{
 Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data['message'],
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ));
   }


  }



  
  addPlanUser(String price, int planId) async {
    dio.Response<dynamic> response =
        await addPlansApiServices.addPlanUser(price, planId);
    if (response.data["status"] == true) {
      // Get.rawSnackbar(
      //   backgroundColor: Colors.green,
      //   messageText: Text(
      //     "Add plan sucessfully",
      //     style: TextStyle(color: Colors.white, fontSize: 15),
      //   ),
      // );
      // Get.offAll(PaymentSucessScreen());
       Get.offAll(()=> PendingApprovalScreen());
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
