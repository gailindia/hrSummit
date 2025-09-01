 

import 'package:flutter/material.dart';
import 'package:hrsummit/data/local/local.storage.dart'; 
import 'package:hrsummit/data/repo/apiClient.dart';
import 'package:hrsummit/data/repo/repository.dart';
import 'package:hrsummit/utils/helper.dart';
import 'package:hrsummit/utils/validation.dart';
import 'package:hrsummit/utils/viewModel.dart';
 

class LoginModel extends ViewModel{

 
  VoidCallback? onLoginSuccess;
  VoidCallback? onVerifySuccess; 
  AppValidation validation = AppValidation();
  TextEditingController userIDController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  ApiClient apiClient = ApiClient();

  bool _isChecked = false;
  bool get isChecked => _isChecked;

  Future<void> loadInitialValue() async {
    // _isChecked = LocalStorage.localStorage.getBool("isChecked") ?? false;
    notifyListeners();
  }

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }
 

  // Future<String?> _getDeviceId() async {
  //   var deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     var iosDeviceInfo = await deviceInfo.iosInfo;
  //     return iosDeviceInfo.identifierForVendor;
  //   } else if (Platform.isAndroid) {
  //     var androidDeviceInfo = await deviceInfo.androidInfo;
  //     return androidDeviceInfo.id;
  //   }
  //   return null;
  // }

  // Future<void> requestLogin() async { 
     
  //   String? emailErrorMessage = validation.userIdOrEmailValidator(userIDController.text.trim());
  //   // String? passwordErrorMessage = validation.passwordValidator(passwordController.text.trim());
    
  //   // if (emailErrorMessage != null || passwordErrorMessage != null) {
  //   //   onError?.call(emailErrorMessage ?? passwordErrorMessage);
  //   //   return;
  //   // }  
  //   await _callLoginApi();
  // }

  Future<void> callLoginApi() async { 
    hideKeyBoard();
    if (isLoading) return;
    
    callApi(() async {
      // String deviceId =  "";
      // // String deviceId = await _getDeviceId() ?? "";

      // String fcmToken="";
      // // String fcmToken = await NotificationHandler.getToken();
      // int deviceType = Platform.isIOS ? 2 : 1;
      
      EndPointRepository repository = EndPointRepository(client: apiClient.init());
      final res = await repository.loginService(
        mobile:  userIDController.text.trim(),  
      );
     

      if (res.statusCode == 200) {
  
        // await LocalStorage.saveUserDetails(
        //   // res.eMAIL ?? "",
        //   //  "",
        //   res.cPFNUMBER ?? "",
        //   // res.dEPARTMENT ?? "",
        //   // res.nAME ?? "",
        //   // res.dESIGNATION ?? ""
        // );
        // Helper.goToRemoveUntil(Homescreen.route);
        // await LocalStorage.saveUserRole(response.responseBody?.role.toString());
        onLoginSuccess?.call();
      } else {
        onError?.call(res.message ?? 'Login failed');
      }
    });
  } 
  Future<void> callotpVarifyApi() async { 
    hideKeyBoard();
    if (isLoading) return;

    callApi(() async { 
      EndPointRepository repository = EndPointRepository(client: apiClient.init());
      final res = await repository.otpService(
        mobile: userIDController.text.trim(),
        otp: otpController.text.trim(),
      );
      if (res.statusCode == 200) {
        await LocalStorage.saveUserDetails(
          res.name ?? "",
           res.company ?? "",
           userIDController.text.trim(),
          res.designation ?? ""
        );

        // Helper.goToRemoveUntil(Homescreen.route);
        // await LocalStorage.saveUserRole(response.responseBody?.role.toString());
        onVerifySuccess?.call();
      } else {
        onError?.call(res.message ?? 'Verification failed');
      }
    });
  } 
}