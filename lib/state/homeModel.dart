 

import 'package:hrsummit/data/model/homeIcon_respModel.dart';
import 'package:hrsummit/data/model/marque_respModel.dart';
import 'package:hrsummit/data/repo/apiClient.dart';
import 'package:hrsummit/data/repo/repository.dart';
import 'package:hrsummit/utils/viewModel.dart';

class HomeModel extends ViewModel {
  final ApiClient apiClient = ApiClient();
 


//   ////////////////////////////// home icon ///////////////////

  
   List<HomeIconData> _homeIconRespDto = [];

  List<HomeIconData> get homeIconRespDto => _homeIconRespDto;

  set homeIconRespDto(value) {
    _homeIconRespDto = value;
    notifyListeners();
  }

  Future<void> callIconApi() async {
    if (isLoading) return; 
    callApi(() async {
      final repository = EndPointRepository(client: apiClient.init());
      final response = await repository.getHomeIconService();
      homeIconRespDto = response.data;  
      // log("upCTrainingResult length ${upCTrainingResult.length}");
    });
  }
  MarqueRespDto _marqueRespDto = MarqueRespDto();

  MarqueRespDto get marqueRespDto => _marqueRespDto;

  set marqueRespDto(value) {
    _marqueRespDto = value;
    notifyListeners();
  }
  
 

  Future<void> callMarqueApi( ) async {
    // if (isLoading) return; 
    callApi(() async {
      final repository = EndPointRepository(client: apiClient.init());
      final response = await repository.getMarqueeService();
      marqueRespDto = response;  
      // log("upCTrainingResult length ${upCTrainingResult.length}");
    });
  } 


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
