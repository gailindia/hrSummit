class ArchivedQuizModelRepo {
  List<Data>? data;
  int? statusCode;

  ArchivedQuizModelRepo({this.data, this.statusCode});

  ArchivedQuizModelRepo.fromJson(Map<String, dynamic> json) {
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
  int? qUESID;
  String? qUESNAME;
  String? oPTION1;
  String? oPTION2;
  String? oPTION3;
  String? oPTION4;
  String? cORRECTANS;
  String? oPTEDANS;

  Data(
      {this.qUIZID,
        this.qUESID,
        this.qUESNAME,
        this.oPTION1,
        this.oPTION2,
        this.oPTION3,
        this.oPTION4,
        this.cORRECTANS,
        this.oPTEDANS});

  Data.fromJson(Map<String, dynamic> json) {
    qUIZID = json['QUIZ_ID'];
    qUESID = json['QUES_ID'];
    qUESNAME = json['QUES_NAME'];
    oPTION1 = json['OPTION1'];
    oPTION2 = json['OPTION2'];
    oPTION3 = json['OPTION3'];
    oPTION4 = json['OPTION4'];
    cORRECTANS = json['CORRECT_ANS'];
    oPTEDANS = json['OPTED_ANS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QUIZ_ID'] = this.qUIZID;
    data['QUES_ID'] = this.qUESID;
    data['QUES_NAME'] = this.qUESNAME;
    data['OPTION1'] = this.oPTION1;
    data['OPTION2'] = this.oPTION2;
    data['OPTION3'] = this.oPTION3;
    data['OPTION4'] = this.oPTION4;
    data['CORRECT_ANS'] = this.cORRECTANS;
    data['OPTED_ANS'] = this.oPTEDANS;
    return data;
  }
}
