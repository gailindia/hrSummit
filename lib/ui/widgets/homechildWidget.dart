// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class ChildWidget extends StatefulWidget {
//   final String? selectedType;
//   final List<UpcomingTrainingRespDTO> trainingList;

//   const ChildWidget({
//     super.key,
//     required this.selectedType,
//     required this.trainingList,
//   });

//   @override
//   State<ChildWidget> createState() => _ChildWidgetState();
// }

// class _ChildWidgetState extends State<ChildWidget> {
//   final todayStr = DateFormat('dd-MM-yyyy').format(DateTime.now());


//   @override
//   Widget build(BuildContext context) {
//     final provider = context.read<HomeModel>();
//     if (widget.trainingList.isEmpty) {
//       return const Center(child: Text("No data found"));
//     }
//     log(
//       "ChildWidget build called with selectedType: ${widget.trainingList.length}",
//     );
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             widget.selectedType ?? "Upcoming Training",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 10),

//           // Dropdown
//           // Container(
//           //   padding: const EdgeInsets.symmetric(horizontal: 12),
//           //   decoration: BoxDecoration(
//           //     border: Border.all(),
//           //     borderRadius: BorderRadius.circular(8),
//           //   ),
//           //   child: DropdownButtonHideUnderline(
//           //     child: DropdownButton<String>(
//           //       value: selectedTraining,
//           //       isExpanded: true,
//           //       items: trainingOptions
//           //           .map((training) => DropdownMenuItem(
//           //                 value: training,
//           //                 child: Text(training),
//           //               ))
//           //           .toList(),
//           //       onChanged: (value) {
//           //         setState(() {
//           //           selectedTraining = value;
//           //         });
//           //       },
//           //     ),
//           //   ),
//           // ),

//           // const SizedBox(height: 20),

//           // Table Header
//           Container(
//             color: Colors.grey.shade200,
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Center(
//                     child: Text("S.No", style: MyStyle.medium5().s14),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Text("Training Name", style: MyStyle.medium5().s14),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Center(
//                     child: Text(
//                       widget.selectedType == "Upcoming Training"
//                           ? "View"
//                           : widget.selectedType == "Archived Training"
//                           ? "Attendance History"
//                           : "Course Material",
//                       style: MyStyle.medium5().s14,
//                       maxLines: 2,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Table Rows
//           ListView.builder(
//             itemCount: widget.trainingList.length,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               // log(" tbl rows ${widget.trainingList}");
//               final item = widget.trainingList[index];
//               return Container(
//                 color:
//                     index.isEven ? Colors.grey.shade100 : Colors.grey.shade300,
//                 padding: const EdgeInsets.only(top: 3),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: Center(
//                         child: Text(
//                           "${index + 1}",
//                           style: MyStyle.medium5().s14,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: Text(
//                         item.tRNAME.toString(),
//                         style: MyStyle.medium5().s14,
//                       ),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Center(
//                         child: IconButton(
//                           icon: Icon(
//                             widget.selectedType == "Training Materials"
//                                 ? Icons.download
//                                 : Icons.remove_red_eye_rounded,
//                           ),
//                           onPressed: () async {
//                             String? empNo = await LocalStorage.getEmpNo() ?? "";
//                             log("builddddd mssss. $empNo ");
//                             if (widget.selectedType == "Archived Training") {
                              
//                               await provider.callattHistoryApi(
//                                 empNo.toString(),
//                                 item.bATCHID.toString(),
//                               );
//                               log("archieve ${provider.totalDays} ${provider.pDays} ${provider.aDays}");
//                               attendenceHistDialog(
//                                 context,
//                                 item.tRNAME.toString(),
//                                 provider.totalDays,
//                                 provider.pDays 
//                               );
//                             } else if (widget.selectedType ==
//                                 "Upcoming Training") {
//                               final result = await provider.callattListApi(
//                                 empNo.toString(),
//                                 double.parse(item.bATCHID.toString()),
//                               );
//                               log("msg upcomingList in dialogue elseeeee ${provider.upCTrainingResult.length}");
//                               log("msg upcomingList in dialogue elseeeee result $result");

//                               if (result.isNotEmpty) {
//                                 log("msg upcomingList in dialogue iffff ${result.length}"); 
//   showAttendanceDialog(context, result, empNo);
//                               }
//                             } else {
//                               log("Download logic here");
//                               provider.callDownloadZip(
//                                 batchId: item.bATCHID.toString(),
//                                 empNo: empNo.toString(), 
//                               );
//                             } 
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
       
    
//         ],
//       ),
//     );
//   }
// }

  
     