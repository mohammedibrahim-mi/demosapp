

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../Api/AppServices.dart';

class LoginApi{

  AppServices services = AppServices();



  Future<Response> login(String email, String pass, String deviceId, String deviceToken, String platform) async {

    try{
      var body = {
        'email': email,
        'password': pass,
        'device_id': deviceId,
        'device_token': deviceToken,
        'device_type': platform,
        'remember_me': 1,
      };
      Response res = await services.request("login",body: body,method: "post");
      return res;
    } on DioError catch (e){
      Logger(printer: PrettyPrinter(colors: true, noBoxingByDefault: true)).e(e.toString());
     throw e.toString();
    }

  }






}