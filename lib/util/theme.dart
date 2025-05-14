// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: Color(0xFFC5CAC8),
      secondary: Color(0xFF007243),
      onSecondary: Color(0xFF007243),
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.white,
      onSurface: Colors.white,
    ),
    appBarTheme: AppBarTheme(foregroundColor: Color(0xFF007243), ),
  );
}
