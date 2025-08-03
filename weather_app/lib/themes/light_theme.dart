
import 'package:flutter/material.dart';

const Color darkBlueText = Color(0xFF0D223A); // Azul oscuro para textos
const Color lightBackground = Color(0xFFB3E0FF);
const Color lightCardBackground = Color(0xFFE3F2FD);
const Color lightAppBarBackground = Color(0xFF90CAF9);
const Color lightAccentYellow = Color(0xFFFFC300);
const Color lightAccentGrey = Color(0xFF90A4AE);
const Color lightAccentWhite = Color(0xFFF5F6FA);
const Color lightAccentBlue = Color(0xFF1976D2);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: lightBackground,
  cardColor: lightCardBackground,
  primaryColor: lightAccentBlue,
  appBarTheme: const AppBarTheme(
    backgroundColor: lightAppBarBackground,
    iconTheme: IconThemeData(color: lightAccentBlue),
    titleTextStyle: TextStyle(
      color: darkBlueText, // Azul oscuro para mejor contraste
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    elevation: 8,
  ),
  colorScheme: const ColorScheme.light(
    primary: lightAccentBlue,
    secondary: lightAccentYellow,
    background: lightBackground,
    surface: lightCardBackground,
    onPrimary: darkBlueText, // Azul oscuro para textos sobre botones claros
    onSecondary: lightAccentGrey,
    onBackground: darkBlueText, // Azul oscuro para textos principales
    onSurface: darkBlueText, // Azul oscuro para textos en tarjetas
  ),
  iconTheme: const IconThemeData(color: lightAccentYellow),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: darkBlueText),
    bodyMedium: TextStyle(color: darkBlueText),
    titleLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: darkBlueText),
    titleMedium: TextStyle(fontSize: 18, color: darkBlueText),
  ),
);
