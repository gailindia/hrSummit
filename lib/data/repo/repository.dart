
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hrsummit/data/model/delegates_respModel.dart';
import 'package:hrsummit/data/model/dignatries_respModel.dart';
import 'package:hrsummit/data/model/homeIcon_respModel.dart';
import 'package:hrsummit/data/model/marque_respModel.dart';
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

//////// homeIcon Service ////////////////////
 Future<HomeIconRespDto> getHomeIconService() async {
    final response = await client.get(
      submitTagsUrl,
    );
    log("getHomeIconService ${response.data}");
    return HomeIconRespDto.fromJson(response.data);
  }
  ///////////////// Marquee ////////////////////////
 Future<MarqueRespDto> getMarqueeService() async {
    final response = await client.get(
      marqueUrl,
    );
    log("getMarqueeService ${response.data}");
    return MarqueRespDto.fromJson(response.data);
  }
  ///////////////// Delegtes ////////////////////////
 Future<DelegateRespDto> getDelegateService() async {
    final response = await client.get(
      delegateUrl,
    );
    log("getDelegateService ${response.data}");
    return DelegateRespDto.fromJson(response.data);
  }
  ///////////////// Dignatries ////////////////////////
 Future<DignatriesRespDto> getDignatriesService() async {
    final response = await client.get(
      dignitariesUrl,
    );
    log("getDignatriesService ${response.data}");
    return DignatriesRespDto.fromJson(response.data);
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