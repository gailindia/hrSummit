class MarkedAttendRespDTO {
  String? statusCode;
  String? message;

  MarkedAttendRespDTO({this.statusCode, this.message});

  MarkedAttendRespDTO.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StatusCode'] = statusCode;
    data['Message'] = message;
    return data;
  }
}
