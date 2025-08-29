class VerifyOtpRespDto {
    VerifyOtpRespDto({
        required this.message,
        required this.statusCode,
        required this.name,
        required this.company,
        required this.designation,
        required this.apkInfo,
        required this.token,
    });

    final String? message;
    final int? statusCode;
    final String? name;
    final String? company;
    final String? designation;
    final List<ApkInfo> apkInfo;
    final String? token;

    factory VerifyOtpRespDto.fromJson(Map<String, dynamic> json){ 
        return VerifyOtpRespDto(
            message: json["message"],
            statusCode: json["status_code"],
            name: json["NAME"],
            company: json["Company"],
            designation: json["Designation"],
            apkInfo: json["APK_INFO"] == null ? [] : List<ApkInfo>.from(json["APK_INFO"]!.map((x) => ApkInfo.fromJson(x))),
            token: json["TOKEN"],
        );
    }

}

class ApkInfo {
    ApkInfo({
        required this.apkCode,
        required this.apkVersion,
        required this.ipaVersion,
    });

    final String? apkCode;
    final String? apkVersion;
    final String? ipaVersion;

    factory ApkInfo.fromJson(Map<String, dynamic> json){ 
        return ApkInfo(
            apkCode: json["APK_CODE"],
            apkVersion: json["APK_VERSION"],
            ipaVersion: json["IPA_VERSION"],
        );
    }

}
