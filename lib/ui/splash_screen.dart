import 'package:flutter/material.dart';
 
import 'package:hrsummit/data/local/local.storage.dart';
import 'package:hrsummit/data/repo/apiClient.dart';
import 'package:hrsummit/data/repo/repository.dart'; 
import 'package:hrsummit/ui/login_screen.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/utils/helper.dart';
import 'package:hrsummit/widgets/logowidget.dart';

import 'home/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  
  static const String route = '/splashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ApiClient apiClient = ApiClient();

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () => {
          checkLogin(),
        // Helper.goToNext(LoginScreen.route),
        // Helper.goToNext(Homescreen.route)
        // Helper.goToNext(QuizListScreen.route)
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
      child: Center(child: LogoWidget()),
    );
  }

  checkLogin() async {
    try {
      var token = await LocalStorage.getToken();
      // //"token $token");
      // String? token = "87|mQMfYnj4hadLVO3OaNqhc1JnqvJqoW5nXd0Ps0A1bb6edf42";

      if (token != null && token.isNotEmpty) {
        EndPointRepository endPointRepsitory = EndPointRepository(
          client: apiClient.init(),
        );
        final response = await endPointRepsitory.getMarqueeService();
        if (response.statusCode == 200) {
          if (context.mounted) {
          Helper.goToRemoveUntil(Homescreen.route);
          }
        } else {
          Helper.goToRemoveUntil(LoginScreen.route);
        }
      } else {
        Helper.goToRemoveUntil(LoginScreen.route);
      }
    } on Exception {
      Helper.goToRemoveUntil(LoginScreen.route);
    }
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
