import 'package:flutter/material.dart';
import 'package:hrsummit/state/delegatesModel.dart';
import 'package:hrsummit/state/dignitarieModel.dart';
import 'package:hrsummit/state/homeModel.dart';
import 'package:hrsummit/state/loginModel.dart';
import 'package:hrsummit/ui/home/delegate_screen.dart';
import 'package:hrsummit/ui/home/dignitaries_screen.dart';
import 'package:hrsummit/ui/home/homeScreen.dart';
import 'package:hrsummit/ui/login_screen.dart';
import 'package:hrsummit/ui/splash_screen.dart';
 
import 'package:provider/provider.dart';

class RouteHelper {
  static Map<String, WidgetBuilder> createRoutes() {
    return {
      SplashScreen.route: (_) => const SplashScreen(),
      

      LoginScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => LoginModel(),
            child: const LoginScreen(),
          ),
      Homescreen.route: (_) => ChangeNotifierProvider(
            create: (_) => HomeModel(),
            child: const Homescreen(),
          ),
      DignitariesScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => DignitariesModel(),
            child: const DignitariesScreen(),
          ),
      DelegateScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => DelegatesModel(),
            child: const DelegateScreen(),
          ),
  
       


       
    };
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Unknown"),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name!.split('/')[1]} Comming soon..'),
        ),
      ),
    );
  }
}