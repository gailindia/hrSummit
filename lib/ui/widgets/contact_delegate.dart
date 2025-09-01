import 'package:flutter/material.dart';
import 'package:hrsummit/data/model/delegates_respModel.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/widgets/styles/mytextStyle.dart'; 


class ContactListPage extends StatelessWidget {
  final List<DelegateData> listDelegate;

  const ContactListPage({super.key, required this.listDelegate});

  @override
  Widget build(BuildContext context) {
    return listDelegate.isNotEmpty
        ?  Expanded(
            child: ListView.builder(
              itemCount: listDelegate.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return ContactCard(contact: listDelegate[index]);
        },
      ),
    )
    : Center(child: Text("No delegates found"));
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
