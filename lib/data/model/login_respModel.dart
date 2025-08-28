class LoginRespDTO {
  String? rESPONSE;
  String? cPFNUMBER;
  double? aPKVERSIONNO;
  String? eMAIL;
  String? iPAVERSION;
  String? bUSINESSAREA;
  String? bANAME;
  String? dEPARTMENT;
  String? dESIGNATION;
  String? nAME;
  dynamic tOKEN;
  int? sTATUSCODE;
  String? mESSAGE;

  LoginRespDTO(
      {this.rESPONSE,
      this.cPFNUMBER,
      this.aPKVERSIONNO,
      this.eMAIL,
      this.iPAVERSION,
      this.bUSINESSAREA,
      this.bANAME,
      this.dEPARTMENT,
      this.dESIGNATION,
      this.nAME,
      this.tOKEN,
      this.sTATUSCODE,
      this.mESSAGE});

  LoginRespDTO.fromJson(Map<String, dynamic> json) {
    rESPONSE = json['RESPONSE'];
    cPFNUMBER = json['CPF_NUMBER'];
    aPKVERSIONNO = json['APK_VERSION_NO'];
    eMAIL = json['EMAIL'];
    iPAVERSION = json['IPA_VERSION'];
    bUSINESSAREA = json['BUSINESS_AREA'];
    bANAME = json['BA_NAME'];
    dEPARTMENT = json['DEPARTMENT'];
    dESIGNATION = json['DESIGNATION'];
    nAME = json['NAME'];
    tOKEN = json['TOKEN'];
    sTATUSCODE = json['STATUSCODE'];
    mESSAGE = json['MESSAGE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RESPONSE'] = this.rESPONSE;
    data['CPF_NUMBER'] = this.cPFNUMBER;
    data['APK_VERSION_NO'] = this.aPKVERSIONNO;
    data['EMAIL'] = this.eMAIL;
    data['IPA_VERSION'] = this.iPAVERSION;
    data['BUSINESS_AREA'] = this.bUSINESSAREA;
    data['BA_NAME'] = this.bANAME;
    data['DEPARTMENT'] = this.dEPARTMENT;
    data['DESIGNATION'] = this.dESIGNATION;
    data['NAME'] = this.nAME;
    data['TOKEN'] = this.tOKEN;
    data['STATUSCODE'] = this.sTATUSCODE;
    data['MESSAGE'] = this.mESSAGE;
    return data;
  }
}
