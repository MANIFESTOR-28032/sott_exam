import 'package:flutter/material.dart';

class AppTheme {
  static const _primaryColor = Color(0xFFFFD600);
  static const _accentColor = Color(0xFF000000);
  
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Gilroy",
    colorScheme: ColorScheme.light(
      primary: _primaryColor,
      secondary: _accentColor,
      background: Colors.white,
      surface: Colors.white,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: _accentColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
} 