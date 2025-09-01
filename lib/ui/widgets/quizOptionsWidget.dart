import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizOptionsWidget extends StatelessWidget {
  QuizOptionsWidget({
    super.key,
    this.selectValue,
    this.text,
    this.selectedOption,
    this.groupVal,
    required this.onPressed,
    this.toggleable,
    this.activeColor,
    this.correctOption,
  });

  String? text;
  String? selectValue;
  int? selectedOption;
  int? correctOption;
  int? groupVal;
  bool? toggleable = false;
  Color? activeColor;
  final Function(int?) onPressed;

  @override
  Widget build(BuildContext context) {
    print("selectValue $selectValue");
    if (selectValue == "P") {
      print("selectValue $selectedOption");
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purple.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: RadioListTile<int>(
          title: Text(text!,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          value: selectedOption!,
          groupValue: selectedOption,
          toggleable: toggleable!,
          activeColor: Colors.green,
          // selected: _radioSelected == getIndex,
          onChanged: onPressed,
        ),
      );
    } else if (selectValue == "O") {
      return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purple.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: RadioListTile<int>(
          title: Text(text!,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          value: correctOption!,
          groupValue: correctOption,
          toggleable: toggleable!,
          activeColor: Colors.grey,
          // selected: _radioSelected == getIndex,
          onChanged: onPressed,
        ),
      );
    } else if (selectValue == "OP") {
      return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purple.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: RadioListTile<int>(
          title: Text(text!,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          value: correctOption!,
          groupValue: correctOption,
          toggleable: toggleable!,
          activeColor: Colors.green,
          // selected: _radioSelected == getIndex,
          onChanged: onPressed,
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple.shade200,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: RadioListTile<int>(
        title: Text(text!,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        value: selectedOption!,
        groupValue: groupVal,
        toggleable: toggleable!,
        activeColor: activeColor,
        // selected: _radioSelected == getIndex,
        onChanged: onPressed,
      ),
    );
  }
}
