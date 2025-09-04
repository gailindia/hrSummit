// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hrsummit/data/model/homeIcon_respModel.dart';
import 'package:hrsummit/state/homeModel.dart';
import 'package:hrsummit/ui/home/delegate_screen.dart';
import 'package:hrsummit/ui/home/dignitaries_screen.dart';
import 'package:hrsummit/ui/home/image_screen.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/utils/helper.dart'; 
import 'package:hrsummit/widgets/styles/mytextStyle.dart';
import 'package:provider/provider.dart'; 

class HomeBottomWidget extends StatelessWidget {
  final List<HomeIconData> items;
  const HomeBottomWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Mytheme.greyLight,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), // prevent inner scroll
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 23,
          mainAxisSpacing: 2,
          childAspectRatio: 0.65,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              log("Tapped on ${item.tYPE}");
              if (item.tYPE == "X") {
                 Helper.goToNext(DignitariesScreen.route);
              } else if (item.tYPE == "D") {
                Helper.goToNext(DelegateScreen.route);
              } else {
                // context.read<HomeModel>().calltabImgApi(item.sQNO.toString(), item.tYPE.toString());
                Helper.goToNext(ItemDetailPage.route,argument: {
                  "sqNo": item.sQNO.toString(),
                  "type" : item.tYPE.toString(),
                  "title" : item.nAME.toString()
                });
                log("Unknown type: ${item.tYPE} ${item.sQNO.toString()} ");
              }
            },
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 1,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Image.network(
                    baseImg + item.iCONNAME.toString(),
                    height: 35,
                    width: 35,
                    color: Colors.deepPurple,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 35,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.nAME ?? "NA",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// class MenuItem {
//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;

//   MenuItem({required this.title, required this.icon, required this.onTap});
// }
// final menuItems = [
//   MenuItem(title: "e-Invites", icon: Icons.mail, onTap: () {}),
//   MenuItem(title: "Dignitaries", icon: Icons.person, onTap: () {}),
//   MenuItem(title: "Delegates", icon: Icons.public, onTap: () {}),
//   MenuItem(title: "Venue", icon: Icons.location_on, onTap: () {}),
//   MenuItem(title: "Gallery", icon: Icons.photo, onTap: () {}),
//   MenuItem(title: "Event Highlights", icon: Icons.event, onTap: () {}),
//   MenuItem(title: "Know The Community", icon: Icons.groups, onTap: () {}),
//   MenuItem(title: "Know Your Host", icon: Icons.badge, onTap: () {}),
// ];

class CommonAppbar extends StatelessWidget {
  final String title;
  final bool isBackButton;
  final VoidCallback? onBack;

  const CommonAppbar({super.key, required this.title, this.onBack,this.isBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 3),
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Mytheme.greyLight,
      child: Row(
        children: [
         !isBackButton
         ? IconButton(
            icon: ImageIcon(AssetImage(arrowback), color: Colors.black87),
            onPressed: onBack ?? () => Navigator.pop(context),
          ) :const SizedBox(width: 40),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: MyStyle.medium5().s16,
            ),
          ),
          const SizedBox(width: 48),  
        ],
      ),
    );
  }
}

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
