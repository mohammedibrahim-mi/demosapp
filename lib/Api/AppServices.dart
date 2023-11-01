

import 'dart:developer';

import 'package:dio/dio.dart';

import 'AppLoggers.dart';


class AppServices {

  final Dio dio = Dio(BaseOptions(
      baseUrl: "https://my.com/api/",
      validateStatus: (status) {
        return status !< 500;
      },
      headers: {
        "Connection": "keep-alive",
      },
      // connectTimeout: 60 * 1000,
      // receiveTimeout: 60 * 1000
  ))
    ..interceptors.add(AppLoggers());

  Future<Response> request(String url, {dynamic body, String? method}) async {
    //var token = await AppStorages.getToken();
    var token = "dfgfhnjkjl";
  //  log("Token $token");
    var response = dio.request(url,
        data: body ?? '',
        options: Options(
            method: method,
            headers: token != null ? {'Authorization': 'Bearer $token'} : null
        ));
    return response;
  }
}

// class DioExceptions implements Exception {
//
//   DioExceptions.fromDioError(DioError dioError) {
//     switch (dioError.type) {
//       case DioErrorType.cancel:
//         message = "Request to API server was cancelled";
//         break;
//       case DioErrorType.connectTimeout:
//         message = "Connection timeout with API server";
//         break;
//       case DioErrorType.other:
//         message = "Connection to API server failed due to internet connection";
//         break;
//       case DioErrorType.receiveTimeout:
//         message = "Receive timeout in connection with API server";
//         break;
//       case DioErrorType.response:
//         message = handleError(dioError.response!.statusCode!, dioError.response!.data);
//         break;
//       case DioErrorType.sendTimeout:
//         message = "Send timeout in connection with API server";
//         break;
//       default:
//         message = "Something went wrong";
//         break;
//     }
//   }
//
//   String message = '';
//
//   String handleError(int statusCode, dynamic error) {
//     switch (statusCode) {
//       case 400:
//         return 'Bad request';
//       case 401:
//         return 'Unauthenticated';
//       case 404:
//         return error["message"];
//       case 500:
//         return 'Internal server error';
//       default:
//         return 'Oops!, Something went wrong';
//     }
//   }
//
//   @override
//   String toString() => message;
// }