// import 'dart:developer';

// import 'package:flutter/material.dart';
 
// import 'package:provider/provider.dart';

// class Homescreen extends StatefulWidget {
//   static const String route = '/home';
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   String empId = "";
//   @override
//   void initState() {
//     withViewModel<HomeModel>(context, (viewModel) async {
//       callEmpNo();
//       // viewModel.callarchiveTrainingApi("00017231"

//       // );
//     });
//     super.initState();
//   }

//   callEmpNo() async {
//     empId = await LocalStorage.localStorage.read(key: "empNo") ?? "";
//     log("empId $empId");
//   }

//   @override
//   Widget build(BuildContext context) { 
//     return MyAppBackGroundVM<HomeModel>(
//       child: Consumer<HomeModel>(
//         builder: (context, provider, child) {  
//           return Scaffold(
//             backgroundColor: Colors.transparent,
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   HeaderWidget(
//                     isIconVisible: true,
//                     onMenuTap: () {},
//                     onProfileTap: () {},
//                   ),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Text(
//                         "User (Employee)",
//                         style: MyStyle.medium5().s22,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10.0,
//                       vertical: 5.0,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Mytheme.orngLight,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: GridView.count(
//                       crossAxisCount: 2,

//                       crossAxisSpacing: 6,
//                       mainAxisSpacing: 2,
//                       shrinkWrap: true,
//                       childAspectRatio: 1.3,
//                       physics: NeverScrollableScrollPhysics(),
//                       children: [
//                         buildDashboardCard(
//                           title: "Mark Attendance",
//                           image: ma,
//                           onTap: () {
//                             provider.selectedType = "Upcoming Training";
//                             provider.callupcTrainingApi(empId);
//                           },
//                         ),
//                         buildDashboardCard(
//                           title: "Archived Trainings",
//                           image: at,
//                           onTap: () {
//                             log("build empno $empId");
//                             provider.selectedType = "Archived Training";
//                             provider.callarchiveTrainingApi(empId);
//                           },
//                         ),
//                         buildDashboardCard(
//                           title: "Training Materials",
//                           image: tm,
//                           onTap: () {
//                             provider.selectedType = "Training Materials";
//                             provider.callTrainingMaterialApi(empId);
//                           },
//                         ),
//                         buildDashboardCard(
//                           title: "Feedback",
//                           image: fb,
//                           onTap: () {
//                             provider.selectedType = "Feedback";
//                           },
//                         ),
//                       ],
//                     ),
//                   ),

//                   provider.selectedType == "Feedback"
//     ? Container(
//         height: 300,
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
//         child: FeedbackFormPage(),
//       )
//     : provider.selectedType == "Upcoming Training"
//         ? !provider.isUpcTrainingApiCalled
//             ? SizedBox.shrink()
//             : provider.upCTrainingResult.isNotEmpty
//                 ? ChildWidget(
//                     selectedType: provider.selectedType,
//                     trainingList: provider.upCTrainingResult,
//                   )
//                 : Center(child: Text("No data found"))
//         : provider.selectedType == "Archived Training"
//             ?   provider.upCTrainingResult.isNotEmpty
//                     ? ChildWidget(
//                         selectedType: provider.selectedType,
//                         trainingList: provider.upCTrainingResult,
//                       )
//                     : Center(child: Text("No data found"))
//             : provider.selectedType == "Training Materials"
//                 ? !provider.isMaterialApiCalled
//                     ? SizedBox.shrink()
//                     : provider.upCTrainingResult.isNotEmpty
//                         ? ChildWidget(
//                             selectedType: provider.selectedType,
//                             trainingList: provider.upCTrainingResult,
//                           )
//                         : Center(child: Text("No data found"))
//                 : SizedBox.shrink()


//                   // provider.selectedType == "Feedback"
//                   //     ? Container(
//                   //       height: 300,
//                   //       width: double.infinity,
//                   //       margin: EdgeInsets.symmetric(
//                   //         horizontal: 18,
//                   //         vertical: 12,
//                   //       ),
//                   //       child: FeedbackFormPage(),
//                   //     )
//                   //     : !provider.isUpcTrainingApiCalled
//                   //     ? SizedBox.shrink()
//                   //     : provider.upCTrainingResult.isNotEmpty
//                   //     ? ChildWidget(
//                   //       selectedType: provider.selectedType,
//                   //       trainingList: provider.upCTrainingResult,
//                   //     )
//                   //     : Center(child: Text("No data found")),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
