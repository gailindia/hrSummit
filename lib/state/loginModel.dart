 

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:learning_app/data/local/local.storage.dart'; 
// import 'package:learning_app/data/repo/apiClient.dart';
// import 'package:learning_app/data/repo/repository.dart';
// import 'package:learning_app/ui/home/homeScreen.dart';
// import 'package:learning_app/utils/helper.dart';
// import 'package:learning_app/utils/validation.dart';
// import 'package:learning_app/utils/viewModel.dart';

// class LoginModel extends ViewModel{

 
//   VoidCallback? onLoginSuccess;
//   VoidCallback? onRememberSuccess; 
//   AppValidation validation = AppValidation();
//   TextEditingController userIDController = TextEditingController();
//   TextEditingController passwordController = TextEditingController(); 
//   ApiClient apiClient = ApiClient();

//   bool _isChecked = false;
//   bool get isChecked => _isChecked;

//   Future<void> loadInitialValue() async {
//     // _isChecked = LocalStorage.localStorage.getBool("isChecked") ?? false;
//     notifyListeners();
//   }

//   set isChecked(bool value) {
//     _isChecked = value;
//     notifyListeners();
//   }
 

//   // Future<String?> _getDeviceId() async {
//   //   var deviceInfo = DeviceInfoPlugin();
//   //   if (Platform.isIOS) {
//   //     var iosDeviceInfo = await deviceInfo.iosInfo;
//   //     return iosDeviceInfo.identifierForVendor;
//   //   } else if (Platform.isAndroid) {
//   //     var androidDeviceInfo = await deviceInfo.androidInfo;
//   //     return androidDeviceInfo.id;
//   //   }
//   //   return null;
//   // }

//   Future<void> requestLogin() async { 
     
//     String? emailErrorMessage = validation.userIdOrEmailValidator(userIDController.text.trim());
//     String? passwordErrorMessage = validation.passwordValidator(passwordController.text.trim());
    
//     if (emailErrorMessage != null || passwordErrorMessage != null) {
//       onError?.call(emailErrorMessage ?? passwordErrorMessage);
//       return;
//     }  
//     await _callLoginApi();
//   }

//   Future<void> _callLoginApi() async {
//     hideKeyBoard();
//     if (isLoading) return;
    
//     callApi(() async {
//       // String deviceId =  "";
//       // // String deviceId = await _getDeviceId() ?? "";

//       // String fcmToken="";
//       // // String fcmToken = await NotificationHandler.getToken();
//       // int deviceType = Platform.isIOS ? 2 : 1;
      
//       EndPointRepository repository = EndPointRepository(client: apiClient.init());
//       final res = await repository.loginService(
//         userEmail: userIDController.text.trim(),
//         pass: passwordController.text.trim(),
    
//       );
//       log("msf ${res.rESPONSE}");

//       if (res.rESPONSE == "TRUE" && res.sTATUSCODE == 200) {
  
//         await LocalStorage.saveUserDetails(
//           // res.eMAIL ?? "",
//           //  "",
//           res.cPFNUMBER ?? "",
//           // res.dEPARTMENT ?? "",
//           // res.nAME ?? "",
//           // res.dESIGNATION ?? ""
//         );
//         Helper.goToRemoveUntil(Homescreen.route);
//         // await LocalStorage.saveUserRole(response.responseBody?.role.toString());
//         // onLoginSuccess?.call();
//       } else {
//         onError?.call(res.mESSAGE ?? 'Login failed');
//       }
//     });
//   } 
// }