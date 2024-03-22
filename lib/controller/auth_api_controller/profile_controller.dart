import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;
import 'package:online_class_app/model/Get_user_model.dart';
import 'package:online_class_app/model/get_privacy_policy.dart';
import 'package:online_class_app/model/profile_model/updateprofile_model.dart';
import 'package:online_class_app/model/update_user_model.dart';
import 'package:online_class_app/services/network/profile_api_service/get_profile_api_service.dart';
import 'package:online_class_app/services/network/auth_api_services/privacy_policy/getprivacy_policy_api_service.dart';
import 'package:online_class_app/screen/Auth/signin_screen.dart';
import 'package:online_class_app/services/network/profile_api_service/get_profile_api_service.dart';
import 'package:online_class_app/services/network/auth_api_services/update_user_data_api_services.dart';
import 'package:online_class_app/services/network/profile_api_service/update_profile_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  ProfileApiServices profileApiServices = ProfileApiServices();
  UsersData? getUserData;
  RxBool isLoading = false.obs;
  getprofile() async {
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await profileApiServices.getProfileApiServices();
    isLoading(false);
    update();
    print('========================data==2=================================');
    if (response.data["status"] == true) {
      GetUserModel getUserModel = GetUserModel.fromJson(response.data);
      getUserData = getUserModel.data;
    } else {
      //  Get.offAll(BottomNaviBar());
    }
    update();
  }

  UpdateProfileApiService updateprofileapiservice = UpdateProfileApiService();

  updateprofile({required Updateprofile updateprofileModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateprofileapiservice
        .updateProfileApi(updateprofile: updateprofileModel);

    isLoading(false);
    if (response.data['status'] == true) {
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: TextStyle(color: Colors.white),
          ));
      update();
    }
  }

  PrivacyPolicyServicesApi privacyPolicyServicesApi =
      PrivacyPolicyServicesApi();
  List<GetPrivaydatalist> getprivayData = [];

//   GetPrivacyPolicy
// GetPrivaydatalist
      //RxBool isLoading = false.obs;
      getprivacypolicy() async {
    isLoading(true);
    update();
    dio.Response<dynamic> response =
        await privacyPolicyServicesApi.privacypolicyApi();
    isLoading(false);
    update();
    print('========================data==2=================================');
    if (response.data["status"] == true) {
      GetPrivacyPolicy getPrivacyPolicy =
          GetPrivacyPolicy.fromJson(response.data);
      getprivayData = getPrivacyPolicy.data;
    } else {
      //  Get.offAll(BottomNaviBar());
      if (response.data["status"] == "Token is Expired") {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', "null");
        Get.offAll(() => SignScreen());
      }
    }
    update();
  }
}
