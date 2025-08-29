  import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {
  final Function() onPressed;
  final String title;
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
     borderRadius: BorderRadius.circular(25),
      onTap: widget.onPressed,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        width: double.infinity, 
                  decoration: BoxDecoration(
                    color: Color(0xff002138),
                    borderRadius: BorderRadius.circular(4),
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
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          // style: buttonTitleStyle,
        ),
      ),
    );
  }
}