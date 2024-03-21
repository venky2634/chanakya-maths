import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_class_app/model/profile_model/updateprofile_model.dart';
import 'package:online_class_app/services/base_api_services/base_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileApiService extends BaseApiServices {

Future updateProfileApi({
  required Updateprofile updateprofile})async{
 
 dynamic responseJson;
 try{
  var dio = Dio();
  final prefs = await SharedPreferences.getInstance();
  String? authtoken = prefs.getString('auth_token');
  var response = await dio.post(profileupdateURL,
  options: Options(
    headers: {
      "Accept":"application/json",
      "Authorization":'Bearer $authtoken'
    },
    followRedirects: false,
    validateStatus: (status){
      return status!<=500;
    }
  ),
  data: {
    "gender":updateprofile.gender,
    "student_name":updateprofile.studentName
  },
  
  );
  print(':::::::::::Profile Update Api Service:::::::::::::<status code>::::::::');
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