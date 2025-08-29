// import 'dart:developer';
// import 'dart:io';
 
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:external_path/external_path.dart';
// import 'package:intl/intl.dart';
// import 'package:learning_app/data/model/attenDetail_respModel.dart';
// import 'package:learning_app/data/model/attndence_hist_respModel.dart'; 
// import 'package:learning_app/data/model/upcomingTraining_respModel.dart';
// import 'package:learning_app/data/repo/apiClient.dart';
// import 'package:learning_app/data/repo/repository.dart';
// import 'package:learning_app/utils/helper.dart';  
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart'; 

import 'package:hrsummit/utils/viewModel.dart';

class HomeModel extends ViewModel {
//   final ApiClient apiClient = ApiClient();
//   String totalDays= "0";
//   String pDays= "0";
//   String aDays= "0";
//   String _selectedType = "Upcoming Training";
//   bool isUpcTrainingApiCalled = false;
//   bool isMaterialApiCalled = false; 
//   String get selectedType => _selectedType;

//   set selectedType(String value) {
//     _selectedType = value;
//     notifyListeners();
//   }
//    List<String> selectedDates = [];




//   // DashboardItemConfig? _selectedConfig;

//   // DashboardItemConfig? get selectedConfig => _selectedConfig;

//   // void setSelectedConfig(DashboardItemConfig config) {
//   //   _selectedConfig = config;
//   //   notifyListeners();
//   // }



//   ////////////////////////////// Upcoming training ///////////////////
//   List<UpcomingTrainingRespDTO> _uptc = [];

//   List<UpcomingTrainingRespDTO> get upCTrainingResult => _uptc;

//   set upCTrainingResult(value) {
//     _uptc = value;
//     notifyListeners();
//   }

//   Future<void> callupcTrainingApi(String empId) async {
//     isUpcTrainingApiCalled = false;
//     if (isLoading) return; 
//     callApi(() async {
//       final repository = EndPointRepository(client: apiClient.init());
//       final response = await repository.getUpcomingTrainingService(empId: empId);
//       upCTrainingResult = response;
//       isUpcTrainingApiCalled = true;
//       notifyListeners();
//       log("upCTrainingResult length ${upCTrainingResult.length}");
//     });
//   }


//   ////////////////////////////// get Attendance list   ///////////////////
//   List<AttendDetailsRespDTO> _attdt = [];

//   List<AttendDetailsRespDTO> get attDetailsListResult => _attdt;

//   set attDetailsListResult(List<AttendDetailsRespDTO> value) {
//     _attdt = value;
//     notifyListeners();
//   }

//   Future<List<AttendDetailsRespDTO>> callattListApi(String empNo,double batchid) async {
//     if (isLoading) return [] ;

//     await callApi(() async {
//       final repository = EndPointRepository(client: apiClient.init());
//       final response = await repository.getAttDetailService(empno: empNo,batchId: batchid);
//       attDetailsListResult = response;
      
//       log("attDetailsListResult length ${attDetailsListResult.length}");
//     });
//     return attDetailsListResult;
//   }

// //   List<Map<String, dynamic>> get uniqueDayList {
// //   final seenDates = <String>{};
// //   final result = <Map<String, dynamic>>[];

// //   for (var item in upCTrainingResult) {
// //     final date = item.dATES ?? "";
// //     if (seenDates.add(date)) {
// //       result.add({
// //         "date": date,
// //         "attendanceMarked": item.uPDATEDON != null && item.uPDATEDON != "0001-01-01T00:00:00"
// //       });
// //     }
// //   }
// //   return result;
// // }
//   //////////////////////////////   Attendance history details ///////////////////
//   List<AttendHistoryRespDTO> _attD = [];

//   List<AttendHistoryRespDTO> get attHistoryDetailResult => _attD;

//   set attHistoryDetailResult(value) {
//     _attD = value;
//     notifyListeners();
//   }

//   Future<void> callattHistoryApi(String empId, String batchId) async {
//     if (isLoading) return;

//     callApi(() async {
//       final repository = EndPointRepository(client: apiClient.init());
//       final response = await repository.getAtthistoryService(empId: empId, batchId: batchId);
//       attHistoryDetailResult = response;
//       totalDays = response.fold<int>(0, (sum, item) {
//     final value = item.tOTALDAYS ?? 0;
//     // return sum + value.toInt(); 
//     return sum + (value is int ? value : (value as num).toInt());
//   }).toString();

//   pDays = response.fold<int>(0, (sum, item) {
//     final value = item.aTTENTDANCECOUNT  ?? 0;
//     return sum + (value is int ? value : (value as num).toInt());
//     // return sum + value.toInt();
//   }).toString();

//   log("attHistoryDetailResult length ${attHistoryDetailResult.length}");
//   log("attHistoryDetailResult totalDays=$totalDays pDays=$pDays");
//     });
//   }
//   ////////////////////////////// archived training ///////////////////
//   //  List<UpcomingTrainingRespDTO> _arT = [];

//   // List<UpcomingTrainingRespDTO> get getArchiveList => _arT;

//   // set getArchiveList(value) {
//   //   _arT = value;
//   //   notifyListeners();
//   // }

//   Future<void> callarchiveTrainingApi(String empId) async {
//     if (isLoading) return;

//     callApi(() async {
//       final repository = EndPointRepository(client: apiClient.init());
//       final response = await repository.getArchivedTrainingService(emp: empId);
//       upCTrainingResult = response;
//       log("getArchiveList length ${upCTrainingResult.length}");
//     });
     
//   }
//   //////////////////////////////   training material ///////////////////
//   // List<UpcomingTrainingRespDTO> _trM = [];

//   // List<UpcomingTrainingRespDTO> get getTrainingMaterialList => _trM;

//   // set getTrainingMaterialList(value) {
//   //   _trM = value;
//   //   notifyListeners();
//   // }

//   Future<void> callTrainingMaterialApi(String empId) async {
//     isMaterialApiCalled = false;
//     if (isLoading) return; 
//     callApi(() async {
//       final repository = EndPointRepository(client: apiClient.init());
//       final response = await repository.getTrainingMaterialService(emp: empId);
//       upCTrainingResult = response;
//       isMaterialApiCalled = true;
//       log("getTrainingMaterialList length ${upCTrainingResult.length}");
//     });
//   }

//   ////////////////////////////// marked attendance ///////////////////////////

//   Future<void> callMarkAttendanceApi({
//     required double batchId,
//     required String empNo,
//     required String date,
//   }) async {
//     if (isLoading) return;

//     callApi(() async {
//       final repository = EndPointRepository(client: apiClient.init());
//       final response = await repository.markAttenService(
//         batchid: batchId,
//         empno: empNo,
//         date: date,
//       );
//       if(response.statusCode == "200") {
//         showFlutterToast(message: response.message ?? "Attendance marked successfully");
//     // log("MarkedAttendance response ${response.data}");
//       }else {
//         onError?.call(response.message ?? 'Attendance marking failed');
//       }
//       log("callMarkAttendanceApi response ${response.toJson()}");
//     });
//   }

//   ///////////////////////////////////. download materials ////////////////////////////
//   Future<void> callDownloadZip({
//     required String batchId,
//     required String empNo, 
//   }) async {
//      if (isLoading) return;

//     callApi(() async {
//   try { 
//     final repository = EndPointRepository(client: apiClient.init());
//       final response = await repository.getDownloadMaterialService(
//         emp: empNo,
//         batchId: batchId
//       );

//     if (response.statusCode == 200) { 
//        String? filePath;
//         final timestamp =
//             DateFormat("yyyyMMdd_HHmmss").format(DateTime.now());
//         final fileName = "lnd_$timestamp.zip";

//         if (Platform.isAndroid) {
//           final androidInfo = await DeviceInfoPlugin().androidInfo;

//           // ✅ Ask permission only if Android 12 or below
//           if (androidInfo.version.sdkInt <= 32) {
//             final status = await Permission.storage.request();
//             if (!status.isGranted) {
//               showFlutterToast(message: "Storage permission denied");
//               return;
//             }
//           }
 
//           final downloadsPath =
//               await ExternalPath.getExternalStoragePublicDirectory(
//                   ExternalPath.DIRECTORY_DOWNLOAD);

//           final appDir = Directory("$downloadsPath/lnd");
//           if (!(await appDir.exists())) {
//             await appDir.create(recursive: true);
//           }

//           filePath = "${appDir.path}/$fileName";
//         } else if (Platform.isIOS) { 
//           final dir = await getApplicationDocumentsDirectory();

//           final String timestamp = DateFormat("yyyyMMdd_HHmmss").format(DateTime.now());
//           filePath = "${dir.path}/lnd_$timestamp.zip";

//           final file = File(filePath);
//           await file.writeAsBytes(response.data);

//           print("📂 iOS file saved at: $filePath");
 
//         }

//         if (filePath == null) {
//           showFlutterToast(message: "Unable to resolve download path");
//           return;
//         }

//         final file = File(filePath);
//         await file.writeAsBytes(response.data);

//         showFlutterToast(message: "Downloaded Successfully");
//         print("✅ File saved at $filePath");

//         // Optional: Open with default app
//         // await OpenFile.open(filePath);
//       } else {
//         log("Failed to download: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error downloading zip: $e");
//     }
//   });
// }


//     //   getAppVersion() async {
//   //     late String _storeLink, _serverAppVersion;

//   //     PackageInfo packageInfo = await PackageInfo.fromPlatform();

//   //     // calling get app version method
//   //     String currentAppVersion =packageInfo.version;
//   //     // update([kAppVersion]);

//   //     if (Platform.isAndroid) {
//   //       _storeLink = 'https://play.google.com/store/apps/details?id=com.gail.gailprms';
//   //       _serverAppVersion = (await LocalStorage.getApkVersion())??"";
//   //     } else if (Platform.isIOS) {
//   //       _storeLink = 'https://apps.apple.com/in/app/prms/id1574884477';
//   //       _serverAppVersion = (await LocalStorage.getIpaVersion())??"";
//   //     }
//   //     print("currentAppVersion :; $currentAppVersion");
//   //     // currentAppVersion = "3.5";
//   //     final int _serverAppVer = int.parse(_serverAppVersion.replaceAll('.', ''));
//   //     final int _currentAppVer =
//   //     int.parse(currentAppVersion!.replaceAll('.', ''));

//   //     if (_serverAppVer > _currentAppVer) {
//   //       // calling update app dialog method
//   //       // updateAppDialog(context : Get.context!, storeLink: _storeLink);
//   //     }
//   //   }
}
