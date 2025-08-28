
import 'package:flutter/material.dart';
import 'package:hrsummit/utils/colors.dart'; 

 
class Font { 
  var _textStyle = const TextStyle();
 
  TextStyle get s46 => _textStyle.copyWith(fontSize: 46); 
  TextStyle get s40 => _textStyle.copyWith(fontSize: 40); 
  TextStyle get s36 => _textStyle.copyWith(fontSize: 36); 
  TextStyle get s30 => _textStyle.copyWith(fontSize: 30); 
  TextStyle get s26 => _textStyle.copyWith(fontSize: 26); 
  TextStyle get s25 => _textStyle.copyWith(fontSize: 25); 
  TextStyle get s22 => _textStyle.copyWith(fontSize: 22); 
  TextStyle get s20 => _textStyle.copyWith(fontSize: 20); 
  TextStyle get s18 => _textStyle.copyWith(fontSize: 18); 
  TextStyle get s16 => _textStyle.copyWith(fontSize: 16); 
  TextStyle get s15 => _textStyle.copyWith(fontSize: 15); 
  TextStyle get s14 => _textStyle.copyWith(fontSize: 14); 
  TextStyle get s12 => _textStyle.copyWith(fontSize: 12); 
  TextStyle get s11 => _textStyle.copyWith(fontSize: 11); 
  TextStyle get s10 => _textStyle.copyWith(fontSize: 10); 
  TextStyle get s8 => _textStyle.copyWith(fontSize: 8);
}

 
class MyStyle extends Font { 
  MyStyle.medium5([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Arial Rounded MT Bold',
      fontWeight: FontWeight.w500,
      color: color ?? Mytheme.black,
    );
  }
 
  
 
} 
  
