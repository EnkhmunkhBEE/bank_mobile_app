import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF1A56DB);
  static const income = Color(0xFF16A34A);
  static const expense = Color(0xFFDC2626);

  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: primary),
    useMaterial3: true,
  );
}
