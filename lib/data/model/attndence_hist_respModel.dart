class AttendHistoryRespDTO {
  String eMPNO;
  dynamic bATCHID;
  String dESCRIPTION;
  dynamic tRID;
  String tRNAME;
  String fROMDATE;
  String tODATE;
  dynamic tOTALDAYS;
  dynamic aTTENTDANCECOUNT;
  dynamic tOTALDAYSABSENT;

  AttendHistoryRespDTO(
      {required this.eMPNO,
      this.bATCHID,
      required this.dESCRIPTION,
      this.tRID,
      required this.tRNAME,
      required this.fROMDATE,
      required this.tODATE,
      this.tOTALDAYS,
      this.aTTENTDANCECOUNT,
      this.tOTALDAYSABSENT});

  AttendHistoryRespDTO.fromJson(Map<String, dynamic> json)
      : eMPNO = json['EMP_NO'] ?? '',
        bATCHID = json['BATCH_ID'],
        dESCRIPTION = json['DESCRIPTION'] ?? '',
        tRID = json['TR_ID'],
        tRNAME = json['TR_NAME'] ?? '',
        fROMDATE = json['FROM_DATE'] ?? '',
        tODATE = json['TO_DATE'] ?? '',
        tOTALDAYS = json['TOTAL_DAYS'],
        aTTENTDANCECOUNT = json['ATTENTDANCECOUNT'],
        tOTALDAYSABSENT = json['TOTAL_DAYS_ABSENT'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['EMP_NO'] = eMPNO;
    data['BATCH_ID'] = bATCHID;
    data['DESCRIPTION'] = dESCRIPTION;
    data['TR_ID'] = tRID;
    data['TR_NAME'] = tRNAME;
    data['FROM_DATE'] = fROMDATE;
    data['TO_DATE'] = tODATE;
    data['TOTAL_DAYS'] = tOTALDAYS;
    data['ATTENTDANCECOUNT'] = aTTENTDANCECOUNT;
    data['TOTAL_DAYS_ABSENT'] = tOTALDAYSABSENT;
    return data;
  }
}
