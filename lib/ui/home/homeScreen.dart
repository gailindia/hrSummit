import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/state/homeModel.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/utils/header_widget.dart';
import 'package:hrsummit/widgets/commonBG.dart';
import 'package:hrsummit/widgets/styles/mytextStyle.dart';
 
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  static const String route = '/home';
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String empId = "";
  @override
  void initState() {
    // withViewModel<HomeModel>(context, (viewModel) async {
    //   callEmpNo();
    //   // viewModel.callarchiveTrainingApi("00017231"

    //   // );
    // });
    super.initState();
  }

  // callEmpNo() async {
  //   empId = await LocalStorage.localStorage.read(key: "empNo") ?? "";
  //   log("empId $empId");
  // }

  @override
  Widget build(BuildContext context) { 
    return MyAppBackGroundVM<HomeModel>(
      child: Consumer<HomeModel>(
        builder: (context, provider, child) {  
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderWidget( 
                  ),
                   SizedBox(height: 8),
                   Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    color: Mytheme.greyLight,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("64 HR Summit of Oil & Gas PSUs",style: MyStyle.medium5().s25,),
                        Image.asset(notifIcon)
                      ],
                     ),
                   ),
                   SizedBox(height: 20,),
                   Text("Welcome to HR Summit!",style: MyStyle.medium5().s25,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Image.asset(day1Agenda,),
                     Image.asset(day2Agenda,),
                   ], 
                   ),
                   SizedBox(height: 10),
 
                 
                 

                  
 
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
