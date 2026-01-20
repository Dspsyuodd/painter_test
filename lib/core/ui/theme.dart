import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neo_canvas/core/ui/colors.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.dark,
    surface: NeoColors.surface,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.pressStart2p(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: NeoColors.onSurface,
      disabledBackgroundColor: Colors.grey,
      foregroundColor: Colors.black,
      disabledForegroundColor: Colors.grey.shade800,
      minimumSize: const Size.fromHeight(48),
      textStyle: const TextStyle(fontSize: 17),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
    ),
  ),
);
