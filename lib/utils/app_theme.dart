import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Seed color
  static const Color seedColor = Color(0xFFFFCB2F);

  // Create color schemes to reuse
  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.light,
    dynamicSchemeVariant: DynamicSchemeVariant.content,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.dark,
  );

  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      color: Colors.transparent,
      foregroundColor: _lightColorScheme.primary,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.primary,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: Colors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: _lightColorScheme.primary, width: 1.5),
        foregroundColor: _lightColorScheme.primary,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        foregroundColor: _lightColorScheme.primary,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFFE0E0E0),
      selectedColor: _lightColorScheme.primaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: const TextStyle(fontSize: 14),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: _lightColorScheme.primary, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: _lightColorScheme.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: _lightColorScheme.error, width: 2),
      ),
      labelStyle: TextStyle(color: Colors.grey.shade700),
    ),
  );

  // Dark theme (for future implementation)
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    // Add more dark theme customizations as needed
  );

  // Helper method to get theme based on brightness
  static ThemeData getTheme(Brightness brightness) {
    return brightness == Brightness.light ? lightTheme : darkTheme;
  }
}
