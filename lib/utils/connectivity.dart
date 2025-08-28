 
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hrsummit/main.dart';
import 'package:hrsummit/utils/helper.dart'; 

enum ConnectivityStatus { WiFi, Cellular, Offline }

class ConnectivityService {
  static ValueNotifier<bool> onStatusChanged = ValueNotifier(false);

  static void startStreaming() {
    Connectivity().onConnectivityChanged.listen((event) {
      //"-=-=event $event");
      if (event == ConnectivityResult.none ||
          event == ConnectivityResult.other) {
        //"-=-=onStatusChanged.value ${onStatusChanged.value}");
        onStatusChanged.value = false;
        if (navigatorkey.currentContext != null) {
         
          // Helper.goToNext(ShowInternetScreen.route);

          Helper.createSnackBar(navigatorkey.currentContext!);
        }  
      }  
       else {
        //"=-==--=>>>else");
        onStatusChanged.value = true;
        if (navigatorkey.currentContext != null) {
          //"in elseeee key");
          // scaffoldMessengerKey.currentState!.hideCurrentSnackBar();

          ScaffoldMessenger.of(navigatorkey.currentContext!).clearSnackBars();
        }
      }

      //  connectivityStatus= _getStatusFromResult(event);
      //  onStatusChanged?.call(connectivityStatus!);
    });
     
  }
   
  static Future<bool> verifyInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      return true;
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      return true;
    }
    return false;
  }
}