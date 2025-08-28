// class ArchivedTrainingRespDTO {
//   dynamic bATCHID;
//   Null eMPNO;
//   String dATES;
//   String uPDATEDON;
//   dynamic tRID;
//   String tRNAME;
//   dynamic dURATION;

//   ArchivedTrainingRespDTO(
//       {required this.bATCHID,
//       this.eMPNO,
//       required this.dATES,
//       required this.uPDATEDON,
//       required this.tRID,
//       required this.tRNAME,
//       required this.dURATION});

//   ArchivedTrainingRespDTO.fromJson(Map<String, dynamic> json)
//       : bATCHID = json['BATCH_ID'],
//         eMPNO = json['EMP_NO'],
//         dATES = json['DATES'],
//         uPDATEDON = json['UPDATED_ON'],
//         tRID = json['TR_ID'],
//         tRNAME = json['TR_NAME'],
//         dURATION = json['DURATION'];
  

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['BATCH_ID'] = bATCHID;
//     data['EMP_NO'] = eMPNO;
//     data['DATES'] = dATES;
//     data['UPDATED_ON'] = uPDATEDON;
//     data['TR_ID'] = tRID;
//     data['TR_NAME'] = tRNAME;
//     data['DURATION'] = dURATION;
//     return data;
//   }
// }
