
import 'package:dio/dio.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/data/model/verifyotp_respModel.dart';
import 'package:hrsummit/data/model/login_respModel.dart';
 
 

 
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