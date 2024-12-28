import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Colors.purple;
const Color secundaryColor = Colors.red;
const Color tertiaryColor = Colors.green;

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
          primary: primaryColor,
          secondary: secundaryColor,
          tertiary: tertiaryColor),
      textTheme: GoogleFonts.robotoTextTheme(),
    );
  }
}
