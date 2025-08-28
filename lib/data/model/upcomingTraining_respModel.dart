class UpcomingTrainingRespDTO {
  dynamic bATCHID;
  dynamic eMPNO;
  String? dATES;
  String? uPDATEDON;
  dynamic tRID;
  String? tRNAME;
  dynamic dURATION;

  UpcomingTrainingRespDTO(
      {this.bATCHID,
      this.eMPNO,
      this.dATES,
      this.uPDATEDON,
      this.tRID,
      this.tRNAME,
      this.dURATION});

  UpcomingTrainingRespDTO.fromJson(Map<String, dynamic> json) {
    bATCHID = json['BATCH_ID'];
    eMPNO = json['EMP_NO'];
    dATES = json['DATES'];
    uPDATEDON = json['UPDATED_ON'];
    tRID = json['TR_ID'];
    tRNAME = json['TR_NAME'];
    dURATION = json['DURATION'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BATCH_ID'] = bATCHID;
    data['EMP_NO'] = eMPNO;
    data['DATES'] = dATES;
    data['UPDATED_ON'] = uPDATEDON;
    data['TR_ID'] = tRID;
    data['TR_NAME'] = tRNAME;
    data['DURATION'] = dURATION;
    return data;
  }
}
