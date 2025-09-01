import 'package:dio/dio.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/data/local/local.storage.dart';

class ApiClient {
  static String token = "";

  Dio init() {
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);

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
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // var token = await LocalStorage.getToken();
    //"token $token");
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ijc5ODc1OTM4NzAiLCJuYmYiOjE3NTYzNzE3MzksImV4cCI6MTc4NzkwNzczOSwiaWF0IjoxNzU2MzcxNzM5fQ.VxirpaE4Imm1pQFqrhEzVvZ52aL0J1VGvs_wh6G5N64";
    // var localLangCode = LocalStorage.prefs.getString('languageId') ?? 'en';
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    // options.headers["Accept-Language"] = localLangCode;

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
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
