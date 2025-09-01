class DignatriesRespDto {
  List<DignatriesData>? data;
  int? statusCode;

  DignatriesRespDto({this.data, this.statusCode});

  DignatriesRespDto.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DignatriesData>[];
      json['data'].forEach((v) {
        data!.add(DignatriesData.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class DignatriesData {
  int? sQNO;
  String? nAME;
  String? tYPE;
  String? dESIGNATION;
  String? cONTENT;
  String? pHOTO;

  DignatriesData(
      {this.sQNO,
      this.nAME,
      this.tYPE,
      this.dESIGNATION,
      this.cONTENT,
      this.pHOTO});

  DignatriesData.fromJson(Map<String, dynamic> json) {
    sQNO = json['SQ_NO'];
    nAME = json['NAME'];
    tYPE = json['TYPE'];
    dESIGNATION = json['DESIGNATION'];
    cONTENT = json['CONTENT'];
    pHOTO = json['PHOTO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SQ_NO'] = sQNO;
    data['NAME'] = nAME;
    data['TYPE'] = tYPE;
    data['DESIGNATION'] = dESIGNATION;
    data['CONTENT'] = cONTENT;
    data['PHOTO'] = pHOTO;
    return data;
  }
}
