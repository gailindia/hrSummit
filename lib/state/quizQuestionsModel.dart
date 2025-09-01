import 'package:hrsummit/data/model/quiz_question_model_repo.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/utils/viewModel.dart';

import '../data/repo/apiClient.dart';
import '../data/repo/repository.dart';
import '../ui/quiz/quiz_list.dart';
import '../utils/helper.dart';

class QuizQuestionsModel extends ViewModel{
  ApiClient apiClient = ApiClient();

  QuizQuestionModelRepo _uptc = QuizQuestionModelRepo();
  int? radioSelected ;

  QuizQuestionModelRepo get upCTrainingResult => _uptc;

  int? get _radioSelected => radioSelected;

  set _radioSelected(va){
    _radioSelected = va;
    notifyListeners();
  }

  set upCTrainingResult(value) {
    _uptc = value;
    notifyListeners();
  }

  Future<void> quizQuestionsApi(String quizId) async {
    hideKeyBoard();
    if (isLoading) return;
    callApi(() async {
      EndPointRepository repository = EndPointRepository(client: apiClient.init());
      final res = await repository.quizQuestionsService(quizId);
      if (res.statusCode == 200) {
        upCTrainingResult = res;
        print(res);
        // onLoginSuccess?.call();
      } else {
        onError?.call( 'Error');
      }
    });
  }

  Future<void> submitQuizApi(String quizId,String responseBy, List<Map<String, String>>  answerList) async {
    hideKeyBoard();
    if (isLoading) return;
    callApi(() async {
      EndPointRepository repository = EndPointRepository(client: apiClient.init());
      final res = await repository.submitQuizService(quizId,responseBy,answerList);
      if (res.statusCode == 200) {
        // upCTrainingResult = res;
        print(res);
        Helper.goToNext(QuizListScreen.route);
        // onLoginSuccess?.call();
      } else {
        onError?.call( 'Error');
      }
    });
  }

}