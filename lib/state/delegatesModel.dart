import 'dart:developer';

import 'package:hrsummit/data/model/delegates_respModel.dart';
import 'package:hrsummit/data/repo/apiClient.dart';
import 'package:hrsummit/data/repo/repository.dart';
import 'package:hrsummit/utils/viewModel.dart';

class DelegatesModel extends ViewModel {

  final ApiClient apiClient = ApiClient();
 
  List<DelegateData> _delegRespDto = [];

  List<DelegateData> get delegRespDto => _delegRespDto;

  set delegRespDto(value) {
    _delegRespDto = value;
    notifyListeners();
  }

  Future<void> calldelegApi() async {
    if (isLoading) return; 
    callApi(() async {
      final repository = EndPointRepository(client: apiClient.init());
      final response = await repository.getDelegateService();
      delegRespDto = response.data;
      log("upCTrainingResult length ${delegRespDto.length}");
    });
  }
}
