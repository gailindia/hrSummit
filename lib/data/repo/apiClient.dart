import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hrsummit/data/local/local.storage.dart';
import 'package:hrsummit/utils/app_constants.dart'; 

class ApiClient {
  static String token = "";

  Dio init() {
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = baseUrl;
    // dio.options.connectTimeout = const Duration(seconds: 60);
    // dio.options.receiveTimeout = const Duration(seconds: 60);
    

    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient dioClient) {
    //   dioClient.badCertificateCallback =
    //       ((X509Certificate cert, String host, int port) => true);
    //   return dioClient;
    // };

    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // var token = await LocalStorage.getToken();
    //"token $token");
    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ijc5ODc1OTM4NzAiLCJuYmYiOjE3NTY0NjMwODQsImV4cCI6MTc4Nzk5OTA4NCwiaWF0IjoxNzU2NDYzMDg0fQ.hymgxbIV5_0_FpM8SXxH9eIR7TTDRZWTRV-n_Swct3o";
      // Debug log
    // log("ApiInterceptors → Request[${options.method}] => PATH: ${options.uri}");
    // log("ApiInterceptors → Token: $token");
    if (token != null &&
        token.isNotEmpty &&
        !options.path.contains("HR_Submit_Login_OTP_aud") &&  
        !options.path.contains("HR_Submit_Verify_OTP_aud"))  {
      options.headers["Authorization"] = "Bearer $token";
    } 
    options.headers["Content-Type"] = "application/json"; 

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("❌ Dio Error: ${err.response?.statusCode} → ${err.message}");
    // log("❌ Response data: ${err.response?.data}");
    // if (err.message!.contains("401")) {
    //   showFlutterToast(message: "acntBlock".tr());
    //   LocalStorage.removeUserToken();
    //   Helper.goToRemoveUntil(LoginScreen.route);
    // }
    // else if (err.message!.contains("422")) {
    //   showFlutterToast(message: "Validationerror".tr());
    // }

    super.onError(err, handler);
  }
}
