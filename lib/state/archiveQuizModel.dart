import 'package:hrsummit/data/model/archived_quiz_model_repo.dart';
import 'package:hrsummit/utils/viewModel.dart';

import '../data/repo/apiClient.dart';
import '../data/repo/repository.dart';
import '../utils/helper.dart';

class ArchiveQuizModel extends ViewModel{
  ApiClient apiClient = ApiClient();

  ArchivedQuizModelRepo _uptc = ArchivedQuizModelRepo();

  ArchivedQuizModelRepo get upCTrainingResult => _uptc;


  set upCTrainingResult(value) {
    _uptc = value;
    notifyListeners();
  }

  Future<void> archiveQuizApi(String quizId) async {
    hideKeyBoard();
    if (isLoading) return;
    callApi(() async {
      EndPointRepository repository = EndPointRepository(client: apiClient.init());
      final res = await repository.archiveQuizService(quizId,"7987593870");
      if (res.statusCode == 200) {
        upCTrainingResult = res;
        print(res);
        // onLoginSuccess?.call();
      } else {
        onError?.call( 'Error');
      }
    });
  }
}