// Created By Surbhi jain 23/jan/2025

import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/app_constants.dart';
import '../utils/colors.dart';


class PrimaryButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? btnColor;
  final OutlinedBorder shape;
  final VoidCallback onPressed;
  final double height, elevation;
  final TextStyle? btnTextStyle;

   PrimaryButton({
    super.key,
    this.width,
    this.height = 48,
    this.elevation = 4,
    this.btnColor = Colors.deepPurpleAccent,
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
  });

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
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        clipBehavior: Clip.antiAlias,
        onPressed: isEnabled ? onPressed as void Function()? : null,
        style: ElevatedButton.styleFrom(
          shape: shape, backgroundColor: btnColor,
          elevation: elevation,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25,
                height: 25,
                child: Image.asset(question)
            ),
            SizedBox(width: 10,),
            Text(isUpperCase ? text!.toUpperCase() : text!,
                style: btnTextStyle),
            Spacer(),
            Text("Start",
                style: btnTextStyle?.copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

class FilledSelectButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? btnColor;
  final VoidCallback onPressed;
  final double height, elevation;
  final OutlinedBorder shape;
  final TextStyle buttonTextStyles;

  const FilledSelectButton({
    super.key,
    this.width,
    this.height = 48,
    this.elevation = 0,
    this.btnColor = Colors.white,
    this.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0))),
    required this.text,
    required this.onPressed,
    required this.buttonTextStyles
  });

  @override
  Widget build(BuildContext context) {

    return _DefaultFilledButton(
      text: text,
      width: width,
      height: height,
      btnColor: btnColor,
      elevation: elevation,
      onPressed: onPressed,
      btnTextStyles: buttonTextStyles, isEnabled: true, isUpperCase: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))),
    );
  }
}

class _DefaultFilledButton extends StatelessWidget {
  final String? text;
  final double? width;
  final Color? btnColor;
  final Function onPressed;
  final OutlinedBorder shape;
  final TextStyle? btnTextStyles;
  final double height, elevation;
  // final EdgeInsetsGeometry margin;
  final bool isEnabled, isUpperCase;

  const _DefaultFilledButton({
    this.width,
    this.btnColor,
    this.height = 48,
    this.elevation = 4,
    this.btnTextStyles = const TextStyle(
      fontSize: 18,
      letterSpacing: 0.27,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    required this.text,
    required this.onPressed, required this.isEnabled, required this.shape,required this.isUpperCase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(left: Platform.isAndroid?MediaQuery.sizeOf(context).width*.05:MediaQuery.sizeOf(context).width*.08,right: Platform.isAndroid?MediaQuery.sizeOf(context).width*.05:MediaQuery.sizeOf(context).width*.08),
      child: ElevatedButton(
        clipBehavior: Clip.antiAlias,
        onPressed: isEnabled ? onPressed as void Function()? : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          elevation: elevation,
          // shape: shape,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        child: Text(isUpperCase ? text!.toUpperCase() : text!,
            style: btnTextStyles?.copyWith(color: Colors.white)),
      ),
    );
  }
}

