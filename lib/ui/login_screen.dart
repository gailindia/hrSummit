import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hrsummit/ui/home/delegate_screen.dart';
import 'package:hrsummit/ui/home/dignitaries_screen.dart';
import 'package:hrsummit/ui/widgets/homeWidgets.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/state/loginModel.dart';
import 'package:hrsummit/ui/home/homeScreen.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/utils/header_widget.dart';
import 'package:hrsummit/utils/helper.dart';
import 'package:hrsummit/utils/viewModel.dart';
import 'package:hrsummit/widgets/commonBG.dart';
import 'package:hrsummit/widgets/common_button.dart';
import 'package:hrsummit/widgets/styles/mytextStyle.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // fetchSecureStorageData();
    withViewModel<LoginModel>(context, (viewModel) {
      viewModel.onVerifySuccess = () {
        Helper.goToRemoveUntil(Homescreen.route);
      };
    });
    super.initState();
  }

  // Future<void> fetchSecureStorageData() async {
  // loginController.userIDController.text =
  //     await LocalStorage.getUserName() ?? "";
  // loginController.passwordController.text =
  //     await LocalStorage.getPassWord() ?? "";
  // if (loginController.userIDController.text.isNotEmpty &&
  //     loginController.passwordController.text.isNotEmpty) {
  //   loginController.loginUser();
  // }
  // }

  bool showOtpSection = false;

  @override
  Widget build(BuildContext context) {
    return MyAppBackGroundVM<LoginModel>(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          // padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              HeaderWidget(),
              // CommonAppbar(
              //   isBackButton: true,
              //   title: "65th HR Summit of Oil & Gas PSUs"),
              Container(
                width: double.infinity,
                // padding: EdgeInsets.symmetric( vertical: 12),
                // margin: EdgeInsets.symmetric(vertical: 10),
                // color: Mytheme.greyLight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Mytheme.greyLight,
                alignment: Alignment.center,
                child: RichText(
                  maxLines: 1,
                  text: TextSpan(
                    style: MyStyle.medium5().s18,

                    children: [
                      TextSpan(text: "65"),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(2, -6),
                          child: Text("th", style: MyStyle.medium5().s14),
                        ),
                      ),
                      TextSpan(text: " HR Summit of Oil & Gas PSUs"),
                    ],
                  ),
                ),
              ),

              Image.asset(
                loginimg,
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 15),
              // Text("Welcome", style: MyStyle.medium5().s22),
              Text(
                "Please Login Here",
                style: MyStyle.medium5(Mytheme.brown).s25,
              ),

              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text("Mobile Number", style: MyStyle.medium5().s15),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 25,
                ),
                child: TextFormField(
                  controller: context.read<LoginModel>().userIDController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    counterText: '',
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "+91",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(height: 24, width: 1, color: Colors.grey),
                        ],
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    hintText: "Enter Mobile Number",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Mytheme.greyLight,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              /// Send OTP Button
              CommonButton(
                margin: 25,
                onPressed: () {
                  // if (context
                  //         .read<LoginModel>()
                  //         .userIDController
                  //         .text
                  //         .trim()
                  //         .isNotEmpty) {
                  //           context.read<LoginModel>().callLoginApi();
                  //           context.read<LoginModel>().onLoginSuccess = () {
                  //            setState(() {
                  //   showOtpSection = true;
                  // });
                  //   };
                  // }
                  Helper.goToNext(Homescreen.route);
                  // Helper.goToNext(DelegateScreen.route);
                  // Helper.goToNext(DignitariesScreen.route);
                },
                title: !showOtpSection ? 'Send OTP' : 'Resend OTP',
              ),

              /// OTP Section
              Visibility(
                visible: showOtpSection,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 13,
                      ),
                      color: Colors.grey.shade200,
                      height: 2,
                    ),
                    // SizedBox(height: 15),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text("OTP", style: MyStyle.medium5().s15),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 25,
                      ),
                      child: TextFormField(
                        controller: context.read<LoginModel>().otpController,
                        keyboardType: TextInputType.phone,
                        maxLength: 6,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          counterText: '',
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          hintText: "Enter OTP",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Mytheme.greyLight,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    CommonButton(
                      margin: 25,
                      onPressed: () {
                        if (context
                            .read<LoginModel>()
                            .otpController
                            .text
                            .trim()
                            .isNotEmpty) {
                          context.read<LoginModel>().callotpVarifyApi();
                        }
                      },
                      title: "Verify OTP",
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.23),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  footer,
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        // bottomSheet:Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 10),
        //   child: Image.asset(
        //             footer,
        //             height: 30,
        //             width: 300,
        //             fit: BoxFit.fill,
        //           ),
        // ),
        // bottomNavigationBar: BottomAppBar(
        //   padding: EdgeInsets.symmetric(vertical: 10.0),
        //   child:  Image.asset(
        //           footer,
        //           height: 30,
        //           width: 220,
        //           fit: BoxFit.fill,
        //         ),
        // ),
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return MyAppBackGroundVM<LoginModel>(
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 25),
//           child: Column(
//             children: [
//               HeaderWidget(onMenuTap: () {}, onProfileTap: () {}),
//               Image.asset(loginimg, height: 200, width: 200, fit: BoxFit.fill),
//               Text("Welcome", style: MyStyle.medium5().s22),
//               Text(
//                 "Please Login Here",
//                 style: MyStyle.medium5(Mytheme.orng).s25,
//               ),

//               SizedBox(height: 15),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("User Name", style: MyStyle.medium5().s15),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                 child: TextFormField(
//                   minLines: 1,
//                   autocorrect: false,
//                   keyboardType: TextInputType.multiline,
//                   controller: context.read<LoginModel>().userIDController,
//                   textCapitalization: TextCapitalization.sentences,
//                   maxLength: 30,
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     counterText: '',
//                     errorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       borderSide: BorderSide(color: Colors.red, width: 2.0),
//                     ),
//                     hintStyle: MyStyle.medium5().s25,
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 12,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 1,
//                         color: Color(0xff151515),
//                       ),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: Color(0xff151515),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               CommonButton(onPressed: () { }, title: 'Send OTP'),
//               // Align(
//               //   alignment: Alignment.centerLeft,
//               //   child: Text("Password", style: MyStyle.medium5().s15),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                 child: TextFormField(
//                   minLines: 1,
//                   autocorrect: false, 
//                   keyboardType: TextInputType.number,
//                   controller: context.read<LoginModel>().otpController,
//                   textCapitalization: TextCapitalization.sentences,
//                   maxLength: 6,

//                   // maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                   // validator: (value) {
//                   //   if (value == null || value.trim().isEmpty) {
//                   //     return 'Password is empty';
//                   //   }
//                   //   return null;
//                   // },
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     counterText: '',
                     
//                     // errorBorder: OutlineInputBorder(
//                     //   borderRadius: BorderRadius.circular(8.0),
//                     //   borderSide: BorderSide(color: Colors.red, width: 2.0),
//                     // ),
//                     hintText: "OTP",
//                     hintStyle: MyStyle.medium5().s25,
//                     //  prefixIcon: Icon(Icons.person_outline_rounded),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 12,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 1,
//                         color: Color(0xff151515),
//                       ),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: Color(0xff151515),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

             
//               SizedBox(height: 15),
//               CommonButton(onPressed: (){}, title: "Verify OTP"),
//               // InkWell(
//               //   onTap: () {
//               //     // Helper.goToNext(Homescreen.route);

//               //      context.read<LoginModel>().requestLogin();
//               //   },

//               //   child: Container(
                  

//               //     child: Text(
//               //       "Login".toUpperCase(),
//               //       style: MyStyle.medium5(Colors.white).s25,
//               //     ),
//               //   ),
//               // ),
//               SizedBox(height: 15),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Image.asset(
//                   footer,
//                   height: 30,
//                   width: 200,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
