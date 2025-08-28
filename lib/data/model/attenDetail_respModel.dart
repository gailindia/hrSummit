 

 class AttendDetailsRespDTO {
  dynamic sNO;
  dynamic bATCHID;
  dynamic bATCHNAME;
  dynamic eMPNO;
  String iSATTENABLED;
    String mARKTTENDANCE;
    String dATES;
    String uPDATEDON;
  dynamic tRID;
  dynamic tRNAME;
  dynamic dURATION;

  AttendDetailsRespDTO(
      {this.sNO,
      this.bATCHID,
      this.bATCHNAME,
      this.eMPNO,
      required this.iSATTENABLED,
      required this.mARKTTENDANCE,
      required this.dATES,
      required this.uPDATEDON,
      this.tRID,
      this.tRNAME,
      this.dURATION});

  AttendDetailsRespDTO.fromJson(Map<String, dynamic> json) 
   : sNO = json['SNO'],
     bATCHID = json['BATCH_ID'],
     bATCHNAME = json['BATCH_NAME'],
     eMPNO = json['EMP_NO'],
     iSATTENABLED = json['IS_ATTENABLED'],
     mARKTTENDANCE = json['MARKTTENDANCE'],
     dATES = json['DATES'],
    uPDATEDON = json['UPDATED_ON'],
    tRID = json['TR_ID'],
    tRNAME = json['TR_NAME'],
    dURATION = json['DURATION'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SNO'] = sNO;
    data['BATCH_ID'] = bATCHID;
    data['BATCH_NAME'] = bATCHNAME;
    data['EMP_NO'] = eMPNO;
    data['IS_ATTENABLED'] = iSATTENABLED;
    data['MARKTTENDANCE'] = mARKTTENDANCE;
    data['DATES'] = dATES;
    data['UPDATED_ON'] = uPDATEDON;
    data['TR_ID'] = tRID;
    data['TR_NAME'] = tRNAME;
    data['DURATION'] = dURATION;
    return data;
  }
}

