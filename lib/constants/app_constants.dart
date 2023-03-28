import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor mainColor = Colors.indigo;

  static const String titletext = "Average Calculation";

  static final TextStyle titleStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );

  static final TextStyle showAverageBodyStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static final TextStyle averageStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: mainColor,
  );

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
