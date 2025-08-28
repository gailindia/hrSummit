 

import 'package:flutter/material.dart';



class PrimaryButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? btnColor;
  final OutlinedBorder shape;
  final VoidCallback onPressed;
  final double height, elevation;
  final TextStyle? btnTextStyle;

  const PrimaryButton({
    Key? key,
    this.width,
    this.height = 48,
    this.elevation = 4,
    this.btnColor = Colors.black,
    this.btnTextStyle =  const TextStyle(
      fontSize: 18,
      letterSpacing: 0.27,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    this.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12))),
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return _DefaultButton(
            text: text,
            width: width,
            shape: shape,
            height: height,
            btnColor: btnColor,
            elevation: elevation,
            onPressed: onPressed,
            btnTextStyle: btnTextStyle, isEnabled: true, isUpperCase: false,
          );
  }
}

class _DefaultButton extends StatelessWidget {
  final String? text;
  final double? width;
  final Color? btnColor;
  final Function onPressed;
  final OutlinedBorder shape;
  final TextStyle? btnTextStyle;
  final double height, elevation;
  final bool isEnabled, isUpperCase;

  const _DefaultButton({
    this.width,
    this.btnColor,
    this.height = 48,
    this.elevation = 4,
    this.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24))),
    this.btnTextStyle = const TextStyle(
      fontSize: 18,
      letterSpacing: 0.27,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    required this.text,
    required this.onPressed,  required this.isEnabled, required this.isUpperCase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1.0, )  ),
    );
    }
}


