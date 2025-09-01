class HomeIconRespDto {
  List<HomeIconData>? data;
  int? statusCode;

  HomeIconRespDto({this.data, this.statusCode});

  HomeIconRespDto.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HomeIconData>[];
      json['data'].forEach((v) {
        data!.add(HomeIconData.fromJson(v));
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

class HomeIconData {
  String? nAME;
  int? sQNO;
  String? tYPE;
  String? iCONNAME;

  HomeIconData({this.nAME, this.sQNO, this.tYPE, this.iCONNAME});

  HomeIconData.fromJson(Map<String, dynamic> json) {
    nAME = json['NAME'];
    sQNO = json['SQ_NO'];
    tYPE = json['TYPE'];
    iCONNAME = json['ICON_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NAME'] = nAME;
    data['SQ_NO'] = sQNO;
    data['TYPE'] = tYPE;
    data['ICON_NAME'] = iCONNAME;
    return data;
  }
}
