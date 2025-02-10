

import 'dart:ui';

import 'package:flutter/material.dart';

class AppUtils {
  static Color primaryColor = Color(0xFFd9eaf1);
  static Color secondaryColor = Color(0xffeef3f6);
  static Color mainColor = Colors.blue;

  static TextStyle mTextStyle12(
      {Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}) {
    return TextStyle(
        color: mColor,
        fontSize: 12,
        fontWeight: mFontWeight,
        fontFamily: "mainFont"
    );
  }

  static TextStyle mTextStyle14(
      {Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.bold}) {
    return TextStyle(
        color: mColor,
        fontSize: 14,
        fontWeight: mFontWeight,
        fontFamily: "mainFont"
    );
  }

  static TextStyle mTextStyle16(
      {Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}) {
    return TextStyle(
        color: mColor,
        fontSize: 16,
        fontWeight: mFontWeight,
        fontFamily: "mainFont"
    );
  }

  static TextStyle mTextStyle25(
      {Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}) {
    return TextStyle(
        color: mColor,
        fontSize: 25,
        fontWeight: mFontWeight,
        fontFamily: "mainFont"
    );
  }

  static TextStyle mTextStyle34(
      {Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal}) {
    return TextStyle(
        color: mColor,
        fontSize: 34,
        fontWeight: mFontWeight,
        fontFamily: "mainFont"
    );
  }

}