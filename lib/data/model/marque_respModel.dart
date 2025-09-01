class MarqueRespDto {
  String? message;
  int? statusCode;
  String? marquee;

  MarqueRespDto({this.message, this.statusCode, this.marquee});

  MarqueRespDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['status_code'];
    marquee = json['marquee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status_code'] = statusCode;
    data['marquee'] = marquee;
    return data;
  }
}
