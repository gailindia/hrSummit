 

import 'package:flutter/material.dart';
import 'package:hrsummit/ui/widgets/homeWidgets.dart';
import 'package:hrsummit/ui/widgets/corouselWidget.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/state/homeModel.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/utils/header_widget.dart';
import 'package:hrsummit/utils/loader.dart';
import 'package:hrsummit/utils/viewModel.dart';
import 'package:hrsummit/widgets/commonBG.dart';
import 'package:hrsummit/widgets/common_button.dart';
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
    withViewModel<HomeModel>(context, (viewModel) async {
     await viewModel.callMarqueApi();
     await viewModel.callIconApi();
    });
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
          if(provider.isLoading || provider.isIconLoading || provider.isMarqueeLoading){
            return Center(child: LoadingIndicator());
          }
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
 
                  HeaderWidget(),
                  SizedBox(height: 8),
                  // Selector<HomeModel, String>(
                  //   selector: (ctx, provider) => provider.,
                  //   builder: (context, value, child) {
                    
                  // }, ),
                 
                   Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Mytheme.greyLight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        provider.marquetext != ""
                  ? Text(provider.marquetext, style: MyStyle.medium5().s18)
                  : Expanded(
                          child: RichText(
                            maxLines: 1,
                            text: TextSpan(
                              style: MyStyle.medium5().s18,

                              children: [
                                // TextSpan(text: "64"),
                                // WidgetSpan(
                                //   child: Transform.translate(
                                //     offset: const Offset(2, -6),
                                //     child: Text("th"),
                                //   ),
                                // ),
                                TextSpan(text: "HR Summit of Oil & Gas PSUs"),
                              ],
                            ),
                          ),
                        ),
                        Image.asset(
                          notifIcon,
                          height: 18,
                          width: 18,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                  DynamicCarousel(),
                  SizedBox(height: 10),

                  Text("Welcome to HR Summit!", style: MyStyle.medium5().s25),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                       "${baseImg}Home/day1-agenda.png",
                        width: 160,
                        height: 110,
                        fit: BoxFit.fill,

                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            day1Agenda, width: 160,
                        height: 110,
                        fit: BoxFit.fill
                       
                          );
                        },
                        
                      ),
                      Image.network(
                       "${baseImg}Home/day2-agenda.png",
                        width: 160,
                        height: 110,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                           day2Agenda,
                        width: 160,
                        height: 110,
                        fit: BoxFit.fill,
                          );
                        },
                      ), 
                    ],
                  ),
                  SizedBox(height: 15),
                  HomeBottomWidget(items: provider.homeIconRespDto),
                  SizedBox(height: 25),
                  CommonButton(margin: 50, onPressed: () {}, title: "Quiz"),
 
                  
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
