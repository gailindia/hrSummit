  import 'package:flutter/material.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/widgets/styles/mytextStyle.dart';

class CommonButton extends StatefulWidget {
  final Function() onPressed;
  final String title;
  final double margin;
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.margin = 10,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
    //  borderRadius: BorderRadius.circular(50),
      onTap: widget.onPressed,
      child: Container(
        height: 42,
        margin: EdgeInsets.symmetric(horizontal: widget.margin), 
        alignment: Alignment.center,
        width: double.infinity, 
                  decoration: BoxDecoration(
                    color: Mytheme.brown,
                    borderRadius: BorderRadius.circular(50),
                  ),
        // decoration: BoxDecoration(
        //   gradient: const LinearGradient(
        //     begin: Alignment.centerRight,
        //     end: Alignment.centerLeft,
        //     colors: [
        //       // ConstColor.blueSecondaryColor,
        //       // ConstColor.bluePrimaryColor,
        //     ],
        //   ),
        //   borderRadius: BorderRadius.circular(25),
        // ),
        child: Text(
          widget.title,
          style:  MyStyle.medium5(Mytheme.white).s16
          // style: buttonTitleStyle,
        ),
      ),
    );
  }
}