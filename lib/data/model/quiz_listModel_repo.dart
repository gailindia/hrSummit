class QuizListModelRepo {
  List<Data>? data;
  int? statusCode;

  QuizListModelRepo({this.data, this.statusCode});

  QuizListModelRepo.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  int? qUIZID;
  String? qUIZNAME;
  String? tYPE;

  Data({this.qUIZID, this.qUIZNAME,this.tYPE});

  Data.fromJson(Map<String, dynamic> json) {
    qUIZID = json['QUIZ_ID'];
    qUIZNAME = json['QUIZ_NAME'];
    tYPE = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QUIZ_ID'] = this.qUIZID;
    data['QUIZ_NAME'] = this.qUIZNAME;
    data['Type'] = this.tYPE;
    return data;
  }
}