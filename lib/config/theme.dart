import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static ThemeData getTheme() => ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
      );
}
