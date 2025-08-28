// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LocalStorage {
 
  static FlutterSecureStorage localStorage =   FlutterSecureStorage();

 static Future<void> saveUserDetails(
  // String username,String password,
  String empNo,
  // String dept,String name,String designation
  ) async {
    // await localStorage.write(key: 'username', value: username);
    // await localStorage.write(key: 'password', value: password);
    await localStorage.write(key: 'empNo', value: empNo);
    // await localStorage.write(key: 'dept', value: dept);
    // await localStorage.write(key: 'name', value: name);
    // await localStorage.write(key: 'designation', value: designation);
  }
 
  static Future<void> setToken(String token) async {
    await localStorage.write(key: 'token', value: token);
  }

  static Future<void> setAppVersion(String apkVersion, String ipaVersion) async{
   await localStorage.write(key: "apk_version", value: apkVersion);
   await localStorage.write(key: "ipa_version", value: ipaVersion);

  }
 ///////////////////////// get data /////////////////////////////
 
  static Future<String?> getUserName() async {
    return await localStorage.read(key: 'username');
    
  }
  static Future<String?> getEmpNo() async {
    return await localStorage.read(key: 'empNo');
  }
  static Future<String?> getPassWord() async {
    return await localStorage.read(key: 'password');
  }
   static Future<String?> getToken() async {
    return await localStorage.read(key: 'token');
  }

  static Future<String?> getApkVersion() async {
    return await localStorage.read(key: 'apk_version');
  }

  static Future<String?> getIpaVersion() async {
    return await localStorage.read(key: 'ipa_version');
  }
  
}