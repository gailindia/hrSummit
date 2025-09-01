import 'package:hrsummit/data/model/dignatries_respModel.dart';
import 'package:hrsummit/data/repo/apiClient.dart';
import 'package:hrsummit/data/repo/repository.dart';
import 'package:hrsummit/utils/viewModel.dart';

class DignitariesModel extends ViewModel { 
  final ApiClient apiClient = ApiClient();
    
 
    List<DignatriesData> _degnRespDto = [];

  List<DignatriesData> get dignRespDto => _degnRespDto;

  set dignRespDto(value) {
    _degnRespDto = value;
    notifyListeners();
  }
 

  Future<void> calldignApi() async {
    if (isLoading) return; 
    callApi(() async {
      final repository = EndPointRepository(client: apiClient.init());
      final response = await repository.getDignatriesService();
      dignRespDto = response.data;
      // log("upCTrainingResult length ${upCTrainingResult.length}");
    });
  }
}
