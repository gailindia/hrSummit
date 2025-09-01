// Created By Surbhi jain 23/jan/2025

import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/app_constants.dart';
import '../utils/colors.dart';

class QuizCard extends StatelessWidget {
  final String quizName;
  final VoidCallback onStart;

  const QuizCard({
    Key? key,
    required this.quizName,
    required this.onStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE7F6), // light lavender background
        borderRadius: BorderRadius.circular(30), // rounded edges
      ),
      child: Row(
        children: [
          /// Left: icon with circular background
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 25,
                height: 25,
                child: Image.asset(question)
            ),
          ),
          const SizedBox(width: 12),

          /// Quiz name text
          Expanded(
            child: Text(
              quizName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          /// Right side "Start" pill button
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFB39DDB), // purple button
              borderRadius: BorderRadius.circular(30),
            ),
            // margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: onStart,
              child: const Text(
                "Start",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black, // matches screenshot (black text)
                ),
              ),
            ),
          ),
        ],
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

