import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrsummit/routes.dart';
import 'package:hrsummit/ui/splash_screen.dart';

 

final GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ConnectivityService.startStreaming();
  // await LocalStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'L&D App',
      theme: ThemeData(fontFamily: 'ARIALM'),
      navigatorKey: navigatorkey,
      home: SplashScreen(),
      routes: RouteHelper.createRoutes(),
      onUnknownRoute: (settings) => RouteHelper.onUnknownRoute(settings),
      initialRoute: initialRoute(),
    );
  }

  String initialRoute() {
    return SplashScreen.route;
  }
}

