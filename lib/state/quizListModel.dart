import 'package:hrsummit/data/model/quiz_listModel_repo.dart';
import 'package:hrsummit/utils/viewModel.dart';

import '../data/local/local.storage.dart';
import '../data/repo/apiClient.dart';
import '../data/repo/repository.dart';
import '../utils/helper.dart';

class QuizListModel extends ViewModel{
  ApiClient apiClient = ApiClient();

    QuizListModelRepo _uptc = QuizListModelRepo();
    QuizListModelRepo _archeive = QuizListModelRepo();

  QuizListModelRepo get upCTrainingResult => _uptc;

  set upCTrainingResult(value) {
    _uptc = value;
    notifyListeners();
  }

  QuizListModelRepo get ArcheiveQuesResult => _archeive;

  set ArcheiveQuesResult(value) {
    _archeive = value;
    notifyListeners();
  }

  Future<void> quizListApi() async {
    hideKeyBoard();
    if (isLoading) return;
    callApi(() async {
      EndPointRepository repository = EndPointRepository(client: apiClient.init());
      final res = await repository.quizListService("7987593870");
      if (res.statusCode == 200) {
        // upCTrainingResult = res;
        List<Data> archive = res.data!.where((data) => data.tYPE == "P" ).toList();
        List<Data> active = res.data!.where((data) => data.tYPE == "A" ).toList();
        if(active.isNotEmpty){
          print("su :: ${active.length}");
          upCTrainingResult.data = active;
        }

        if(archive.isNotEmpty){
          print("su :: ${archive.length}");
          ArcheiveQuesResult.data = archive;
        }
        // onLoginSuccess?.call();
      } else {
        onError?.call( 'Error');
      }
    });
  }

}