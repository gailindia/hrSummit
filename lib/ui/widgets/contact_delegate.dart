import 'package:flutter/material.dart';
import 'package:hrsummit/data/model/delegates_respModel.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/widgets/styles/mytextStyle.dart'; 

// class ContactCard extends StatelessWidget {
//   final List<Data> listDelegate;

//   const ContactCard({super.key, required this.listDelegate});

//   Widget buildRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 90, // fixed width for alignment
//             child: Text(
//               "$label :",
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 13,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF1ECF9),
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             spreadRadius: 1,
//             offset: const Offset(2, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           buildRow("Name","Lorem Ipsum"),
//           buildRow("Company", "contact.company"),
//           buildRow("Designation", "contact.designation"),
//           buildRow("Email", "contact.email"),
//           buildRow("Phone No", "contact.phone"),
//         ],
//       ),
//     );
//   }
// }


class ContactListPage extends StatelessWidget {
  final List<DelegateData> listDelegate;

  const ContactListPage({super.key, required this.listDelegate});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listDelegate.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return ContactCard(contact: listDelegate[index]);
        },
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final DelegateData contact;

  const ContactCard({super.key, required this.contact});

  Widget buildRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90, 
            child: Text(
              label,
              style:  MyStyle.medium5(Mytheme.lightBlack).s14
            ),
          ),
           Text(
              " :   ",
              style:  MyStyle.medium5(Mytheme.lightBlack).s14
            ),
          Expanded(
            child: Text(
              value ?? "-",  
             style: MyStyle.medium5(Mytheme.lightBlack).s14
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEEE9FF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRow("Name", contact.nAME),
          buildRow("Company", contact.cOMPANY),
          buildRow("Designation", contact.dESIGNATION),
          buildRow("Email", contact.eMAILID),
          buildRow("Phone No", contact.mOBNO),
        ],
      ),
    );
  }
}
