import 'package:flutter/material.dart';
import 'package:hrsummit/constants/app_constants.dart';
import 'package:hrsummit/ui/login_screen.dart';
import 'package:hrsummit/utils/helper.dart';
import 'package:hrsummit/widgets/logowidget.dart'; 
 

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
      },
    );
  } 

 

  @override
  Widget build(BuildContext context) {  
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImage),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: LogoWidget())
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const LogoWidget(height: 120,),
        //       SizedBox(height: 12),
        //       // Column(
        //       //   children: [
        //       //     Center(
        //       //       child: Text(
        //       //         kAppName,
        //       //         maxLines: 2,
        //       //         // style: GoogleFonts.hind(
        //       //         //   textStyle: Theme.of(context).textTheme.headlineMedium,
        //       //         //   fontSize: 25,
        //       //         //   color: Colors.white,
        //       //         //   fontWeight: FontWeight.w700,
        //       //         //   fontStyle: FontStyle.normal,
        //       //         // ),
        //       //       ),
        //       //     ),
        //       //     Center(
        //       //       child: Text(
        //       //         kWorkPermit,
        //       //         maxLines: 2,
        //       //         // style: GoogleFonts.hind(
        //       //         //   textStyle: Theme.of(context).textTheme.headlineMedium,
        //       //         //   fontSize: 25,
        //       //         //   color: Colors.white,
        //       //         //   fontWeight: FontWeight.w700,
        //       //         //   fontStyle: FontStyle.normal,
        //       //         // ),
        //       //       ),
        //       //     ),
        //       //     Center(
        //       //       child: Text(
        //       //         kAppNamelast,
        //       //         maxLines: 2,
        //       //         // style: GoogleFonts.hind(
        //       //         //   textStyle: Theme.of(context).textTheme.headlineMedium,
        //       //         //   fontSize: 25,
        //       //         //   color: Colors.black87,
        //       //         //   fontWeight: FontWeight.w700,
        //       //         //   fontStyle: FontStyle.normal,
        //       //         // ),
        //       //       ),
        //       //     ),
        //       //   ],
        //       // ), //style: textStyle24Bold),
           
        //     ],
        //   ),
        // ),
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
