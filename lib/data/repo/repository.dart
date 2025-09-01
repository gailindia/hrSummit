
import 'package:dio/dio.dart';
import 'package:hrsummit/data/local/local.storage.dart';
import 'package:hrsummit/data/model/archived_quiz_model_repo.dart';
import 'package:hrsummit/data/model/quiz_question_model_repo.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/data/model/verifyotp_respModel.dart';
import 'package:hrsummit/data/model/login_respModel.dart';

import '../model/quiz_listModel_repo.dart';
 
 

 
class EndPointRepository {
  final Dio client;

  const EndPointRepository({required this.client});


  /// Login service
  Future<LoginRespDto> loginService({
    required String mobile}) async {
    // log("loginService $userEmail  pass $pass");
    var data = {"mobile": mobile};

    final response = await client.post(
      loginUrl,
      data: data,
    );
    return LoginRespDto.fromJson(response.data);
  }

  /// otp service
  Future<VerifyOtpRespDto> otpService({required String mobile,
    required String otp}) async {
    // log("otpService $userEmail  pass $pass");
    var data = {"mobile": mobile, "OTP": otp};

    final response = await client.post(
      verifyOtpUrl,
      data: data,
    );
    return VerifyOtpRespDto.fromJson(response.data);
  }

  /// quizlist service
  Future<QuizListModelRepo> quizListService(String mobileNo) async {
    var data = {"RESPONSE_BY": mobileNo};
    final response = await client.get(
        quizListUrl, data: data
    );
    print("response ******:: $response");
    return QuizListModelRepo.fromJson(response.data);
  }


  /// quizQuestions service
  Future<QuizQuestionModelRepo> quizQuestionsService(String quizId) async {
    var data = {"QUIZ_ID": quizId};
    final response = await client.post(
        quizQuestionUrl,
        data: data
    );
    print("response ******:: $response");
    return QuizQuestionModelRepo.fromJson(response.data);
  }

  /// quizQuestions service
  Future<ArchivedQuizModelRepo> archiveQuizService(String quizId,String responseBy) async {
    var data = {"QUIZ_ID": quizId,"RESPONSE_BY":responseBy};
    final response = await client.post(
        archiveQuizUrl,
        data: data
    );
    print("response ******:: $response");
    return ArchivedQuizModelRepo.fromJson(response.data);
  }

  /// quizAnswers service
  Future<submitResponseRepo> submitQuizService(String quizId,String responseBy,   List<Map<String, String>> answerList) async {
    var data =  {
      "QUIZ_ID": quizId,
      "RESPONSE_BY": responseBy,
      "data": answerList,
    };
    print("data :: ${data}");
    final response = await client.post(
        submitQuizUrl,
        data: data
    );
    print("response ******:: $response");
    return submitResponseRepo.fromJson(response.data);
  }


/// Get user profile
// Future<GetUserDTO> getUserService() async {
//   return _handleResponse<GetUserDTO>(() =>
//     client.get("user/getprofile")
//   );
// }

/// Update user profile
// Future<UpdateProfileResDTO>
// updateProfileService(
//   File? image,
//   String fullName,
// ) async {
//   final formData = image != null && image.path.isNotEmpty
//       ? FormData.fromMap({
//           "full_name": fullName,
//           "profile": await MultipartFile.fromFile(
//             image.path,
//             filename: "profile.png",
//             contentType: MediaType("image", "png"),
//           ),
//         })
//       : FormData.fromMap({
//           "full_name": fullName,
//         });

//   return _handleResponse<UpdateProfileResDTO>(() =>
//     client.post("user/updateprofile", data: formData)
//   );
// }

}
  

  
