 

import 'package:flutter/material.dart'; 
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrsummit/main.dart';
import 'package:hrsummit/utils/colors.dart';

 

class Helper {
  static Future<T?> goToNext<T>(String routeName,
      {dynamic argument, BuildContext? context}) async {
    Navigator.pushNamed(context ?? navigatorkey.currentContext!, routeName,
        arguments: argument);
    return null;
  }
 

  static goToPrev<T>() async {
    return Navigator.pop(navigatorkey.currentContext!);
  }

  static Future<T?> goToRemoveUntil<T>(String routeName,
      {dynamic argument, BuildContext? context}) async {
    return await Navigator.pushNamedAndRemoveUntil(
      context ?? navigatorkey.currentContext!,
      routeName,
      (route) => false,
      arguments: argument,
    );
  }
 
 

    static createSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(days: 1),
      backgroundColor: Mytheme.black,
      content: Row(
        children: [
          const Icon(
            Icons.wifi_off_outlined,
            color: Colors.grey,
          ),
          SizedBox(width: 10),
          Text('Please check your internet connection',
              style: const TextStyle(
                  color: Mytheme.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    ));
  }

  static DateTime? backBtnPressTime;
  // static Future<bool> onLoginBackPressed() async {
  //   DateTime currentTime = DateTime.now();
  //   bool backButton = backBtnPressTime == null ||
  //       currentTime.difference(backBtnPressTime!) > const Duration(seconds: 3);
  //   if (backButton) {
  //     backBtnPressTime = currentTime;
  //     showFlutterToast(
  //       message: 'DoubleExit',
  //     );
  //     return false;
  //   }
  //   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  //   return true;
  // }
}
 
void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void showFlutterToast({required String message}) {
  // final snackBar = SnackBar(
  //   content: Text(
  //     message,
  //     style: const TextStyle(color: MyTheme.white),
  //     textAlign: TextAlign.center,
  //   ),
  //   duration: const Duration(seconds: 1),
  //   backgroundColor: MyTheme.red,
  //   margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(8.0),
  //   ),
  //   behavior: SnackBarBehavior.floating,
  // );

  // ScaffoldMessenger.of(navigatorkey.currentContext!).showSnackBar(snackBar);
  Fluttertoast.showToast(
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      msg: message,
      timeInSecForIosWeb: 1,
      backgroundColor: Mytheme.black,
      textColor: Mytheme.white);
}
 