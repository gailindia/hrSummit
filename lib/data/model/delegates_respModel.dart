class DelegateRespDto {
  List<DelegateData>? data;
  int? statusCode;

  DelegateRespDto({this.data, this.statusCode});

  DelegateRespDto.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DelegateData>[];
      json['data'].forEach((v) {
        data!.add(DelegateData.fromJson(v));
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

class DelegateData {
  String? mOBNO;
  String? nAME;
  String? cOMPANY;
  String? dESIGNATION;
  String? eMAILID;

  DelegateData({this.mOBNO, this.nAME, this.cOMPANY, this.dESIGNATION, this.eMAILID});

  DelegateData.fromJson(Map<String, dynamic> json) {
    mOBNO = json['MOB_NO'];
    nAME = json['NAME'];
    cOMPANY = json['COMPANY'];
    dESIGNATION = json['DESIGNATION'];
    eMAILID = json['EMAIL_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MOB_NO'] = mOBNO;
    data['NAME'] = nAME;
    data['COMPANY'] = cOMPANY;
    data['DESIGNATION'] = dESIGNATION;
    data['EMAIL_ID'] = eMAILID;
    return data;
  }
}
