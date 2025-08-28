 

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hrsummit/data/model/login_respModel.dart';
 
 

 
class EndPointRepository {
  final Dio client;

  const EndPointRepository({required this.client});
 

  /// Login service
  Future<LoginRespDTO> loginService({
     required String userEmail, required String pass}) async {
      log("loginService $userEmail  pass $pass");
    var data = {"USERID": userEmail, "PASSWORD": pass};

    final response = await client.post(
      "UserLogin",
      data: data,
    );
    return LoginRespDTO.fromJson(response.data);
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