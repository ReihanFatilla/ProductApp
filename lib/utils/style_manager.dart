import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return GoogleFonts.inter().copyWith(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRateTextStyle({
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return _getTextStyle(fontSize, fontWeight, Colors.blueAccent);
}

TextStyle getBlackTextStyle({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return _getTextStyle(fontSize, fontWeight, Colors.black);
}

TextStyle getWhiteTextStyle({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return _getTextStyle(fontSize, fontWeight, Colors.white);
}
