import 'package:flutter/material.dart';

final Color lightBackground = Color(0xFFB3E0FF); // Light sky blue
final Color lightCardBackground = Color(0xFFE3F2FD); // Lighter blue for cards
final Color lightAppBarBackground = Color(0xFF90CAF9); // AppBar blue
final Color lightAccentYellow = Color(0xFFFFC300);
final Color lightAccentGrey = Color(0xFF90A4AE);
final Color lightAccentWhite = Color(0xFFF5F6FA);
final Color lightAccentBlue = Color(0xFF1976D2);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: lightBackground,
  cardColor: lightCardBackground,
  primaryColor: lightAccentBlue,
  appBarTheme: AppBarTheme(
    backgroundColor: lightAppBarBackground,
    iconTheme: const IconThemeData(color: Color(0xFF1976D2)),
    titleTextStyle: const TextStyle(
      color: Color(0xFF0D223A), // Azul oscuro para mejor contraste
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    elevation: 8,
  ),
  colorScheme: ColorScheme.light(
    primary: lightAccentBlue,
    secondary: lightAccentYellow,
    background: lightBackground,
    surface: lightCardBackground,
    onPrimary:
        Color(0xFF0D223A), // Azul oscuro para textos sobre botones claros
    onSecondary: lightAccentGrey,
    onBackground: Color(0xFF0D223A), // Azul oscuro para textos principales
    onSurface: Color(0xFF0D223A), // Azul oscuro para textos en tarjetas
  ),
  iconTheme: const IconThemeData(color: Color(0xFFFFC300)),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF0D223A)),
    bodyMedium: TextStyle(color: Color(0xFF0D223A)),
    titleLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0D223A)),
    titleMedium: TextStyle(fontSize: 18, color: Color(0xFF0D223A)),
  ),
);
