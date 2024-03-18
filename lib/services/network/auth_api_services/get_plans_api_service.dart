import 'dart:io';

import 'package:online_class_app/model/get_classlist_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPlanApiServices extends BaseApiServices {
  Future getPlansUser() async {
    dynamic responseJson;
    try {
      var dio = Dio();
       final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      var response = dio.get(getplanUrl,
        
          options: Options(
            headers: {
  'Authorization': 'Bearer $authtoken'
},
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
          ));
      responseJson = response;
    } on SocketException {
      print("No internet");
    }
    return responseJson;
  }
}
