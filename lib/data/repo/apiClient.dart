import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/data/local/local.storage.dart';

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
    var token = await LocalStorage.getToken();
    //"token $token");
    // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ijc5ODc1OTM4NzAiLCJuYmYiOjE3NTY0NjMwODQsImV4cCI6MTc4Nzk5OTA4NCwiaWF0IjoxNzU2NDYzMDg0fQ.hymgxbIV5_0_FpM8SXxH9eIR7TTDRZWTRV-n_Swct3o";
     
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    // options.headers["Accept-Language"] = localLangCode;

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("onError $err");
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
