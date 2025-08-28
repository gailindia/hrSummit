// class TrainingMaterialRespDTO {
//   dynamic bATCHID;
//   String eMPNO;
//   String dATES;
//   String uPDATEDON;
//   dynamic tRID;
//   String tRNAME;
//   dynamic dURATION;

//   TrainingMaterialRespDTO(
//       {this.bATCHID,
//       required this.eMPNO,
//       required this.dATES,
//       required this.uPDATEDON,
//       this.tRID,
//       required this.tRNAME,
//       this.dURATION});

//   TrainingMaterialRespDTO.fromJson(Map<String, dynamic> json)
//       : bATCHID = json['BATCH_ID'],
//         eMPNO = json['EMP_NO'],
//         dATES = json['DATES'],
//         uPDATEDON = json['UPDATED_ON'],
//         tRID = json['TR_ID'],
//         tRNAME = json['TR_NAME'],
//         dURATION = json['DURATION'];
 

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['BATCH_ID'] = this.bATCHID;
//     data['EMP_NO'] = this.eMPNO;
//     data['DATES'] = this.dATES;
//     data['UPDATED_ON'] = this.uPDATEDON;
//     data['TR_ID'] = this.tRID;
//     data['TR_NAME'] = this.tRNAME;
//     data['DURATION'] = this.dURATION;
//     return data;
//   }
// }
