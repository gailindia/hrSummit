class ImaageRespModel {
  List<ImaageDataRespModel> data;
  int statusCode;

  ImaageRespModel({required this.data, required this.statusCode});

  ImaageRespModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] != null)
            ? List<ImaageDataRespModel>.from(
                json['data'].map((v) => ImaageDataRespModel.fromJson(v)))
            : [],
        statusCode = json['status_code'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.map((v) => v.toJson()).toList();
      data['status_code'] = statusCode;
    return data;
  }
}

class ImaageDataRespModel {
   String? iMGURL;

  ImaageDataRespModel({required this.iMGURL});

  ImaageDataRespModel.fromJson(Map<String, dynamic> json) {
    iMGURL = json['IMG_URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IMG_URL'] = iMGURL;
    return data;
  }
}
