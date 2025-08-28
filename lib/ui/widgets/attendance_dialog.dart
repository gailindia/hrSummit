// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; 
// import 'package:provider/provider.dart';

// // void showAttendanceDialog(BuildContext context,HomeModel homeModel) {
// //   final homeModel = context.read<HomeModel>();
// //   // log("show dialog length: ${data.length}");
// //   final todayStr = DateFormat('dd-MM-yyyy').format(DateTime.now());

// // showDialog(
// //   context: context,
// //   builder: (_) {
// //     log("showAttendanceDialog data length: ${data.length}");
// //     return Center(
// //       child: Material(
// //         borderRadius: BorderRadius.circular(16),
// //         color: Colors.white,
// //         child: SizedBox(
// //           width: 250,
// //           height: 450,
// //           child: Column(
// //             children: [
// //               // Header
// //               Container(
// //                 decoration: const BoxDecoration(
// //                   color: Colors.black87,
// //                   borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
// //                 ),
// //                 padding: const EdgeInsets.all(12),
// //                 child: const Center(
// //                   child: Text(
// //                     "Training Details",
// //                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //                   ),
// //                 ),
// //               ),

// //                Expanded(
// //                     child: FutureBuilder<List<UpcomingTrainingRespDTO>>(
// //                       future: homeModel.getUpcomingTrainingList(), // API call here
// //                       builder: (context, snapshot) {
// //                         if (!snapshot.hasData) {
// //                           return const Center(child: CircularProgressIndicator());
// //                         }
// //                         final data = snapshot.data!;

// //                         return ListView.builder(
// //                           itemCount: data.length,
// //                           itemBuilder: (context, index) {
// //                             final item = data[index];
// //                             final dateStr = item.dATES ?? '';
// //                             final isToday = dateStr == todayStr;

// //                             return Container(
// //                               decoration: BoxDecoration(
// //                                 border: Border.all(
// //                                   color: isToday ? Colors.black : Colors.grey,
// //                                   width: 1.5,
// //                                 ),
// //                                 borderRadius: BorderRadius.circular(8),
// //                               ),
// //                               margin: const EdgeInsets.symmetric(
// //                                   vertical: 4, horizontal: 8),
// //                               child: CheckboxListTile(
// //                                 title: Text(dateStr),
// //                                 value: isToday
// //                                     ? homeModel.selectedDates.contains(dateStr)
// //                                     : false,
// //                                 onChanged: isToday
// //                                     ? (val) {
// //                                         setState(() {
// //                                           if (val == true) {
// //                                             homeModel.selectedDates.add(dateStr);
// //                                           } else {
// //                                             homeModel.selectedDates.remove(dateStr);
// //                                           }
// //                                           homeModel.notifyListeners();
// //                                         });
// //                                       }
// //                                     : null,
// //                               ),
// //                             );
// //                           },
// //                         );
// //                       },
// //                     ),
// //                   ),

// //               // List of dates
// // //               Expanded(
// // //                 child: ListView.builder(
// // //                   itemCount: data.length,
// // //                   itemBuilder: (context, index) {

// // //                     final item = data[index];
// // //                       log("indxxx list i $index");
// // //                     log("indxxx list  b${item.bATCHID}");
// // //                     log("indxxx list d ${item.dATES}");
// // //                     log("indxxx list du  ${item.dURATION}");
// // //                     log("indxxx list e ${item.eMPNO}");
// // //                     log("indxxx list  tr${item.tRNAME}");

// // //                     final dateStr = item.dATES ?? '';

// // //     final isToday = dateStr == todayStr;

// // //                     return Container(
// // // decoration: BoxDecoration(
// // //   border: Border.all(
// // //     color: isToday ? Colors.black : Colors.grey,
// // //     width: 1.5,
// // //   ),
// // //   borderRadius: BorderRadius.circular(8),
// // // ),
// // // margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
// // //                       child: CheckboxListTile(
// // //                         title: Text(item.dATES.toString() ?? 'NA'),
// // //                         value: isToday
// // //                             ? (homeModel.selectedDates.contains(item.dATES))
// // //                             : false,
// // //                         onChanged: isToday
// // //             ? (val) {
// // //                 if (val == true) {
// // //                   homeModel.selectedDates.add(dateStr);
// // //                 } else {
// // //                   homeModel.selectedDates.remove(dateStr);
// // //                 }
// // //                 homeModel.notifyListeners();
// // //               }
// // //             : null,
// // //                         //  isToday
// // //                         //     ? (val) {
// // //                         //         if (val == true) {
// // //                         //           homeModel.selectedDates.add(item.dATES!);
// // //                         //         } else {
// // //                         //           homeModel.selectedDates.remove(item.dATES!);
// // //                         //         }
// // //                         //         homeModel.notifyListeners();
// // //                         //       }
// // //                         //     : null,
// // //                       ),
// // //                     );
// // //                   },
// // //                 ),
// // //               ),

// //               // Footer buttons
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.end,
// //                   children: [
// //                     TextButton(
// //                       onPressed: () => Navigator.pop(context),
// //                       child: const Text("Close"),
// //                     ),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         Navigator.pop(context);
// //                       },
// //                       child: const Text("Save"),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   },
// // );
// // }

// //////////////////////////////. history attendance ///////////////////////////////////////////////
// void attendenceHistDialog(
//   BuildContext context,
//   String trName,
//   String totalDays,
//   String presentDays 
// ) {
//   showDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (_) {
//       return Center(
//         child: Material(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//           child: Container(
//             width: 200,
//             height: 100,
//             padding: EdgeInsets.symmetric(vertical: 10),
//             // child: Text("44",textAlign: TextAlign.center,)
//             child: Text(
//               "Training: $trName\nTotal Days: $totalDays\nPresent Days: $presentDays\nAbsent Days: ${int.parse(totalDays) - int.parse(presentDays)}",
//               textAlign: TextAlign.center, 
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// ////////////////////////////// mark attendance ///////////////////////////////////////////////
// void showAttendanceDialog(
//   BuildContext parentContext,
//   List<AttendDetailsRespDTO> upcomingList,
//   String empId,
// ) {
//   log("msg upcomingList in dialogue ${upcomingList.length}");
//   final todayStr = DateFormat('dd-MM-yyyy').format(DateTime.now()); 
//   bool isMarked = false;
//   double batchId = 0.0;
//   bool isSelected = false;

//   showDialog(
//     context: parentContext,
//     barrierDismissible: true,
//     builder: (_) {
//       return StatefulBuilder(
//         builder: (dialogContext, setState) {
//           return Center(
//             child: Material(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.transparent,
//               child: Container(
//                 width: 250,
//                 height: 450,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 // padding: EdgeInsets.symmetric(vertical: 10),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(16),
//                         ),
//                       ),
//                       padding: const EdgeInsets.all(10),
//                       child: const Center(
//                         child: Text(
//                           "Training Details",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),

//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: upcomingList.length,
//                         itemBuilder: (context, index) {
//                           final item = upcomingList[index];

//                           final dateStr = item.dATES.toString();

//                           // log(
//                           //   "msg upcomingList in dialogue build  $dateStr **** $todayStr",
//                           // );
//                           // for (var item in upcomingList) {
//                             if (todayStr == dateStr) {
//                               log(
//                                 "msg upcomingList in dialogue for id ****${item.bATCHID}",
//                               );
//                               batchId = item.bATCHID;
//                               log(
//                                 "msg upcomingList in dialogue for batchId ****$batchId",
//                               );
//                             }
//                           // }

//                           return Container(
//                             decoration: BoxDecoration(
//                               color:
//                                   index.isEven
//                                       ? Colors.grey.shade100
//                                       : Colors.grey.shade100,
//                               border: Border.all(
//                                 color: Colors.black,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             margin: EdgeInsets.symmetric(
//                               vertical: 4,
//                               horizontal: 8,
//                             ),
//                             child: CheckboxListTile(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               checkboxShape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               side: BorderSide(
//                                 color:
//                                     todayStr == dateStr
//                                         ? Colors.black
//                                         : Colors.grey,
//                                 width: 2,
//                               ),
//                               title: Text(
//                                 "Day ${index + 1}",
//                                 style: TextStyle(
//                                   color:
//                                       (todayStr == item.dATES &&
//                                               item.iSATTENABLED == "true")
//                                           ? Colors
//                                               .black // 🔓 enabled
//                                           : Colors.grey, // 🔒 disabled
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),

                              
//                               //     value:
//                               //         item.mARKTTENDANCE == "PRESENT" ||
//                               //                 todayStr == dateStr
//                               //             ? true
//                               //             : false,
//                               //     onChanged: (value) {
//                               //       isSelected = !isSelected;
//                               //   //      setState(() {
//                               //   // item.mARKTTENDANCE =
//                               //   //     value == true ? "PRESENT" : "ABSENT";
//                               // // });
//                               //     },
//                               // value:  isSelected, 
//                               value: item.mARKTTENDANCE == "PRESENT", 

//                               onChanged: 
//                               //   setState(() { 
//                               //     isSelected = !isSelected;
//                               //     isMarked = value!;
//                               //   });
//                               // }
//                                   (todayStr == item.dATES &&
//                                           item.iSATTENABLED == "ENABLED" 
//                                   //          && item.mARKTTENDANCE == "ABSENT" 
//                                           ) 
//                                      ?
//                                   (value) {  
//                                           setState(() {  
//                                              log("vlue. &&& $isMarked ****** $value");
//                                             isSelected = !isSelected;
//                                           item.mARKTTENDANCE =
//                                               value == true 
//                                                 ? "PRESENT"
//                                                   : "ABSENT";
//                                                   isMarked = value!;
//                                         //   item.mARKTTENDANCE = value! ? "PRESENT" : "ABSENT";
//                                         //  isMarked = value;
//                                         }); 
//                                       }
//                                       :  null
//                               // }
//                             ),
//                           );
//                         },
//                       ),
//                     ),

//                     //  Footer buttons
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           TextButton(
//                             onPressed: () => Navigator.pop(dialogContext),
//                             child: const Text("Close"),
//                           ),
//                           ElevatedButton(
//                             onPressed: isMarked
//                             ? () async {
//                               log("save**** $batchId");  
//                               await parentContext
//                                   .read<HomeModel>()
//                                   .callMarkAttendanceApi(
//                                     batchId: batchId,
//                                     empNo: empId,
//                                     date: todayStr,
//                                   );
//                               Navigator.pop(dialogContext);
//                             }
//                             : null,
//                             child: const Text("Save"),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }
