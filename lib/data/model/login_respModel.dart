class LoginRespDto {
    LoginRespDto({
        required this.message,
        required this.statusCode,
    });

    final String? message;
    final int? statusCode;

    factory LoginRespDto.fromJson(Map<String, dynamic> json){ 
        return LoginRespDto(
            message: json["message"],
            statusCode: json["status_code"],
        );
    }

}
