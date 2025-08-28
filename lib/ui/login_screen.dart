// import 'dart:async';

// import 'package:flutter/material.dart';
 
// import 'package:provider/provider.dart';

// class LoginScreen extends StatefulWidget {
//   static const String route = '/loginScreen';
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool numbervisible = true;
//   bool _visiblePassword = true;
//   bool otpvisible = false;
//   bool obsecureTextShow = true;

//   int secondsRemaining = 45;

//   bool enableResend = false;
//   Timer? timer;
//   String? otp = "", roletype = '';
//   List<String> role = [
//     'Permit Receiver',
//     'Permit Issuer',
//     'F&S Authorization',
//     'In-Charge',
//   ];

//   // @override
//   // void initState() {
//   //   // fetchSecureStorageData();
//   //   super.initState();
//   // }

//   // Future<void> fetchSecureStorageData() async {
//     // loginController.userIDController.text =
//     //     await LocalStorage.getUserName() ?? "";
//     // loginController.passwordController.text =
//     //     await LocalStorage.getPassWord() ?? "";
//     // if (loginController.userIDController.text.isNotEmpty &&
//     //     loginController.passwordController.text.isNotEmpty) {
//     //   loginController.loginUser();
//     // }
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return MyAppBackGroundVM<LoginModel>(
//   //     child: Scaffold(
//   //       backgroundColor: Colors.transparent,
//   //       body: SingleChildScrollView(
//   //         padding: EdgeInsets.symmetric(horizontal: 25),
//   //         child: Column(
//   //           children: [
//   //             HeaderWidget(onMenuTap: () {}, onProfileTap: () {}),
//   //             Image.asset(loginimg, height: 200, width: 200, fit: BoxFit.fill),
//   //             Text("Welcome", style: MyStyle.medium5().s22),
//   //             Text(
//   //               "Please Login Here",
//   //               style: MyStyle.medium5(Mytheme.orng).s25,
//   //             ),

//   //             SizedBox(height: 15),
//   //             Align(
//   //               alignment: Alignment.centerLeft,
//   //               child: Text("User Name", style: MyStyle.medium5().s15),
//   //             ),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 5.0),
//   //               child: TextFormField(
//   //                 minLines: 1,
//   //                 autocorrect: false,
//   //                 keyboardType: TextInputType.multiline,
//   //                 controller: context.read<LoginModel>().userIDController,
//   //                 textCapitalization: TextCapitalization.sentences,
//   //                 maxLength: 30,
//   //                 decoration: InputDecoration(
//   //                   fillColor: Colors.white,
//   //                   filled: true,
//   //                   counterText: '',
//   //                   errorBorder: OutlineInputBorder(
//   //                     borderRadius: BorderRadius.circular(8.0),
//   //                     borderSide: BorderSide(color: Colors.red, width: 2.0),
//   //                   ),
//   //                   hintStyle: MyStyle.medium5().s25,
//   //                   contentPadding: EdgeInsets.symmetric(
//   //                     vertical: 10,
//   //                     horizontal: 12,
//   //                   ),
//   //                   enabledBorder: OutlineInputBorder(
//   //                     borderSide: const BorderSide(
//   //                       width: 1,
//   //                       color: Color(0xff151515),
//   //                     ),
//   //                     borderRadius: BorderRadius.circular(6.0),
//   //                   ),
//   //                   focusedBorder: const OutlineInputBorder(
//   //                     borderSide: BorderSide(
//   //                       width: 1,
//   //                       color: Color(0xff151515),
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //             Align(
//   //               alignment: Alignment.centerLeft,
//   //               child: Text("Password", style: MyStyle.medium5().s15),
//   //             ),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 5.0),
//   //               child: TextFormField(
//   //                 minLines: 1,
//   //                 autocorrect: false,
//   //                 obscureText: _visiblePassword,
//   //                 keyboardType: TextInputType.multiline,
//   //                 controller: context.read<LoginModel>().passwordController,
//   //                 textCapitalization: TextCapitalization.sentences,
//   //                 maxLength: 20,

//   //                 // maxLengthEnforcement: MaxLengthEnforcement.enforced,
//   //                 validator: (value) {
//   //                   if (value == null || value.trim().isEmpty) {
//   //                     return 'Password is empty';
//   //                   }
//   //                   return null;
//   //                 },
//   //                 decoration: InputDecoration(
//   //                   fillColor: Colors.white,
//   //                   filled: true,
//   //                   counterText: '',
//   //                   suffixIcon: InkWell(
//   //                     onTap:
//   //                         () => setState(
//   //                           () => _visiblePassword = !_visiblePassword,
//   //                         ),
//   //                     child: Padding(
//   //                       padding: const EdgeInsets.all(14.0),
//   //                       child: Icon(
//   //                         _visiblePassword
//   //                             ? Icons.visibility_off
//   //                             : Icons.visibility,
//   //                         color: Color(0xff1E1E1E),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   errorBorder: OutlineInputBorder(
//   //                     borderRadius: BorderRadius.circular(8.0),
//   //                     borderSide: BorderSide(color: Colors.red, width: 2.0),
//   //                   ),
//   //                   // hintText: "Password",
//   //                   hintStyle: MyStyle.medium5().s25,
//   //                   //  prefixIcon: Icon(Icons.person_outline_rounded),
//   //                   contentPadding: EdgeInsets.symmetric(
//   //                     vertical: 10,
//   //                     horizontal: 12,
//   //                   ),
//   //                   enabledBorder: OutlineInputBorder(
//   //                     borderSide: const BorderSide(
//   //                       width: 1,
//   //                       color: Color(0xff151515),
//   //                     ),
//   //                     borderRadius: BorderRadius.circular(6.0),
//   //                   ),
//   //                   focusedBorder: const OutlineInputBorder(
//   //                     borderSide: BorderSide(
//   //                       width: 1,
//   //                       color: Color(0xff151515),
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),

//   //             Row( 
//   //               crossAxisAlignment: CrossAxisAlignment.center,
//   //               children: [
//   //                 Theme(
//   //                   data: Theme.of(context).copyWith(
//   //                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//   //                     visualDensity: VisualDensity(
//   //                       horizontal: -4,
//   //                       vertical: -4,
//   //                     ),
//   //                   ),
//   //                   child: Checkbox(
//   //                     value: !obsecureTextShow,
//   //                     checkColor: Mytheme.black,
//   //                     shape: RoundedRectangleBorder(
//   //                       borderRadius: BorderRadius.circular(5),
//   //                     ),
//   //                     fillColor: WidgetStateProperty.all(Mytheme.white),
//   //                     side: WidgetStateBorderSide.resolveWith(
//   //                       (states) =>
//   //                           BorderSide(color: Mytheme.black, width: 1.5),
//   //                     ),
//   //                     visualDensity: VisualDensity.compact,
//   //                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//   //                     onChanged: (bool? value) {
//   //                       setState(() {
//   //                         obsecureTextShow = !obsecureTextShow;
//   //                         // context.read<RegisterModel>().checkTerms =
//   //                         //     !context.read<RegisterModel>().checkTerms;
//   //                       });
//   //                     },
//   //                   ),
//   //                 ),
//   //                 Text(
//   //                   "Remember Me",
//   //                   maxLines: 1,
//   //                   style: MyStyle.medium5().s12,
//   //                 ),

//   //                 // TextButton(
//   //                 //   onPressed: () {
//   //                 //     // Navigator.popUntil(context, (route) => route.isFirst);
//   //                 //     // Navigator.pushNamed(context, ForgetPasswordScreen.route);
//   //                 //   },
//   //                 //   child: Text(
//   //                 //     "Forgot Password?",
//   //                 //     style: MyStyle.medium5().s14,
//   //                 //   ),
//   //                 // ),
//   //               ],
//   //             ),

//   //             SizedBox(height: 15),
//   //             InkWell(
//   //               onTap: () {
//   //                 // Helper.goToNext(Homescreen.route);

//   //                  context.read<LoginModel>().requestLogin();
//   //               },

//   //               child: Container(
//   //                 width: double.infinity,
//   //                 alignment: Alignment.center,
//   //                 height: 45,
//   //                 decoration: BoxDecoration(
//   //                   color: Color(0xff002138),
//   //                   borderRadius: BorderRadius.circular(4),
//   //                 ),

//   //                 child: Text(
//   //                   "Login".toUpperCase(),
//   //                   style: MyStyle.medium5(Colors.white).s25,
//   //                 ),
//   //               ),
//   //             ),
//   //             SizedBox(height: 15),
//   //             Align(
//   //               alignment: Alignment.bottomCenter,
//   //               child: Image.asset(
//   //                 footer,
//   //                 height: 30,
//   //                 width: 200,
//   //                 fit: BoxFit.fill,
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }
