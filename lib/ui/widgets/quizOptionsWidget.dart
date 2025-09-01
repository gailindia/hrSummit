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
    if(selectValue == "P"){
      print("selectValue $selectedOption");
      return  SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: RadioListTile<int>(
          title: Text(text!),
          value: selectedOption!,
          groupValue: selectedOption,
          toggleable: toggleable!,
          activeColor: Colors.green,
          // selected: _radioSelected == getIndex,
          onChanged: onPressed,
        ),
      );
    }else if(selectValue == "O"){
      return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: RadioListTile<int>(
          title: Text(text!),
          value: correctOption!,
          groupValue: correctOption,
          toggleable: toggleable!,
          activeColor: Colors.grey,
          // selected: _radioSelected == getIndex,
          onChanged: onPressed,
        ),
      );
    }else if(selectValue == "OP"){
      return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: RadioListTile<int>(
          title: Text(text!),
          value: correctOption!,
          groupValue: correctOption,
          toggleable: toggleable!,
          activeColor: Colors.green,
          // selected: _radioSelected == getIndex,
          onChanged: onPressed,
        ),
      );
    }
    return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: RadioListTile<int>(
              title: Text(text!),
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
