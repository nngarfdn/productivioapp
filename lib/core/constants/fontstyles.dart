import 'package:flutter/material.dart';

class FontStyles {
  // Regular font, size 14
  static const TextStyle regular = TextStyle(
    fontFamily: 'DMSans',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  // Medium font, size 14
  static const TextStyle medium = TextStyle(
    fontFamily: 'DMSans',
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  // Bold font, size 14
  static const TextStyle bold = TextStyle(
    fontFamily: 'DMSans',
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  // Regular font with italics, size 14
  static const TextStyle italic = TextStyle(
    fontFamily: 'DMSans',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontStyle: FontStyle.italic,
  );

  // Medium italic font, size 14
  static const TextStyle mediumItalic = TextStyle(
    fontFamily: 'DMSans',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    fontStyle: FontStyle.italic,
  );

  // Bold italic font, size 14
  static const TextStyle boldItalic = TextStyle(
    fontFamily: 'DMSans',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    fontStyle: FontStyle.italic,
  );

  // Customizable TextStyle function
  static TextStyle custom({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    FontStyle fontStyle = FontStyle.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: 'DMSans',
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: color,
    );
  }
}