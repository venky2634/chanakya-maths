import 'dart:io';

import 'package:online_class_app/model/get_classlist_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';
import 'package:dio/dio.dart';

class GetClassListApiServices extends BaseApiServices {
  Future getClassListUser() async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = dio.get(getClassListUrl,
          options: Options(
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
