import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;
import 'package:online_class_app/model/Get_user_model.dart';
import 'package:online_class_app/model/get_privacy_policy.dart';
import 'package:online_class_app/services/network/auth_api_services/get_profile_api_service.dart';
import 'package:online_class_app/services/network/auth_api_services/privacy_policy/getprivacy_policy_api_service.dart';

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

  PrivacyPolicyServicesApi privacyPolicyServicesApi =
      PrivacyPolicyServicesApi();
  List<GetPrivaydatalist> getprivayData = [];
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
    }
    update();
  }
}
