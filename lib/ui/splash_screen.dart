 
import 'package:flutter/material.dart'; 
 
import 'package:flutter/material.dart';
import 'package:hrsummit/ui/quiz/quiz_list.dart';
import 'package:hrsummit/utils/app_constants.dart'; 
import 'package:hrsummit/ui/login_screen.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/utils/helper.dart';
import 'package:hrsummit/widgets/logowidget.dart';

import 'home/homeScreen.dart';
 

class SplashScreen extends StatefulWidget {
  static const String route = '/splashScreen';
  const SplashScreen({super.key,});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> { 

  @override
  void initState() { 
    super.initState();
     
    Future.delayed(
      const Duration(seconds: 4),
      () => {
        // checkLogin(),
        // Helper.goToNext(LoginScreen.route)
        // Helper.goToNext(Homescreen.route)
        Helper.goToNext(QuizListScreen.route)
      },
    );
  } 

 

  @override
  Widget build(BuildContext context) {  
    return Container(
      color: Mytheme.white,
      // decoration: BoxDecoration(
      //   image: DecorationImage(image: AssetImage(kIconLogo), fit: BoxFit.cover)
      // ), 
      child: Center(
        child: LogoWidget(),
      ),
    );
  }

     checkLogin() async {
    // try {
    //   String? token = LocalStorage.prefs.getString('token');
    //   // //"token $token");
    //   // String? token = "87|mQMfYnj4hadLVO3OaNqhc1JnqvJqoW5nXd0Ps0A1bb6edf42";

    //   if (token != null) {
    //     ApiClient.token = token;

    //      EndPointRepsitory endPointRepsitory =
    //               EndPointRepsitory(client: apiClient.init());
    //           final response = await endPointRepsitory.getUserService();
    //           if (response.success == true) {
    //              Helper.goToRemoveUntil(
    //       BottomClass.route,
    //     );
    //           } else {
    //              Helper.goToRemoveUntil(LoginScreen.route);
    //           }  
        // Helper.goToRemoveUntil(LoginScreen.route);

       
    //   } else {
    //     Helper.goToRemoveUntil(LoginScreen.route);
    //   }
    // } on Exception {
    //   Helper.goToRemoveUntil(LoginScreen.route);
    // }
  }

  // void getAppVersion() async {
  //   String? response;
  //   response = await _prmsServices.getversionData();
  //   if (response == "succuss") {

  //   } else {

  //   }


  //   setState(() {});
  //   if (this.mounted) {}
  //   // _prefs.setString(
  //   //       "APK_VERSION", _response.body["APK_INFO"][0]["APK_VERSION"]);
  //   //   _prefs.setString(
  //   //       "IPA_VERSION", _response.body["APK_INFO"][0]["IPA_VERSION"]);
  // }
}
