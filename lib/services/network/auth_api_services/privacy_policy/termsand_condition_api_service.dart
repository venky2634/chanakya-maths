import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermsandconditionApiService extends BaseApiServices{

Future termsAndConditionApi()async{

  dynamic responseJson;

  try{
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString('auth_token');
    var response = await dio.get(termsandconditionURL,
    options: Options(
      headers: {
        'Accept':"application/json",
        "Authorization":"Bearer $authtoken"
      },
      followRedirects: false,
      validateStatus: (status){
        return status!<=500;
      }
    ));
    print('::::::::::::Terms And Condition Api Service::::::::::<status code>::::::::::');
    print(response.data);
    print(response.statusCode);
    responseJson = response;
  }
  on SocketException{
    print('no internet');
  }
  return responseJson;
}

}