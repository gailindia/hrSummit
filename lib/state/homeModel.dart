 

import 'dart:developer';

import 'package:hrsummit/data/model/homeIcon_respModel.dart';
import 'package:hrsummit/data/model/iamge_respModel.dart';
import 'package:hrsummit/data/model/marque_respModel.dart';
import 'package:hrsummit/data/repo/apiClient.dart';
import 'package:hrsummit/data/repo/repository.dart';
import 'package:hrsummit/utils/viewModel.dart';

class HomeModel extends ViewModel {
  final ApiClient apiClient = ApiClient();
    bool isMarqueeLoading = false;
  bool isIconLoading = false;
  String marquetext = "";

  
//   ////////////////////////////// home icon ///////////////////

  
  List<HomeIconData> _homeIconRespDto = [];

  List<HomeIconData> get homeIconRespDto => _homeIconRespDto;

  set homeIconRespDto(value) {
    if (!hasListeners) return;
    _homeIconRespDto = value;
    notifyListeners();
  }

  Future<void> callIconApi() async {
    // if (isLoading) return; 
     if (isIconLoading) return;
    isIconLoading = true;
    callNotify();
    callApi(() async {
      final repository = EndPointRepository(client: apiClient.init());
      final response = await repository.getHomeIconService();
      if (!hasListeners) return;
      homeIconRespDto = response.data;  
      // log("upCTrainingResult length ${upCTrainingResult.length}");
    }, showLoading: false).whenComplete(() {
      isIconLoading = false;
      callNotify();
      });
      
  }


  ///////////////////. Marquee////////////////////////////////
  MarqueRespDto _marqueRespDto = MarqueRespDto();

  MarqueRespDto get marqueRespDto => _marqueRespDto;

  set marqueRespDto(value) {
    if (!hasListeners) return;
    _marqueRespDto = value;
    notifyListeners();
  }
  

  Future<void> callMarqueApi( ) async {
    if (isLoading) return; 
    if (isMarqueeLoading) return;
    isMarqueeLoading = true;
     callNotify();
    callApi(() async {
      final repository = EndPointRepository(client: apiClient.init());
      final response = await repository.getMarqueeService();
      if (!hasListeners) return;
      marqueRespDto = response;  
      marquetext  = response.marquee ?? "";
      log("marqueRespDto   $marqueRespDto");
    },showLoading: false).whenComplete(() {
      isMarqueeLoading = false;
      callNotify();
    }); 
  }  

  ///////////////////////////////////. tab content images //////////////////////////
  List<ImaageDataRespModel> _immgRespDto = [];

  List<ImaageDataRespModel> get tabImgRespDto => _immgRespDto;

  set tabImgRespDto(value) {
    _immgRespDto = value;
    notifyListeners();
  }
 

  Future<void> calltabImgApi(String sqNo,String type) async {
    if (isLoading) return; 
    callApi(() async {
      final repository = EndPointRepository(client: apiClient.init());
      final response = await repository.getTabImageService(
        sqNo: sqNo,type: type
      );
      tabImgRespDto = response.data;
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
