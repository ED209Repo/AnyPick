import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class APfontsStyle{
  // Create a custom TextStyle with your desired font
  static TextStyle customTextStyle(
      {
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }
  )
  {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}