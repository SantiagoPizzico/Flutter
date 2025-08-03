import 'package:flutter/material.dart';

const Color lightWhiteText = Color(0xFFF5F6FA); // Blanco claro para textos

const Color darkBackground = Color(0xFF18191A);
const Color darkCardBackground = Color(0xFF23272A);
const Color darkAccentYellow = Color(0xFFFFC300);
const Color darkAccentGrey = Color(0xFFB0B3B8);
const Color darkAccentWhite = lightWhiteText;
const Color darkAccentBlue = Color(0xFF1976D2);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBackground,
  cardColor: darkCardBackground,
  primaryColor: darkAccentBlue,
  appBarTheme: const AppBarTheme(
    backgroundColor: darkCardBackground,
    iconTheme: IconThemeData(color: darkAccentYellow),
    titleTextStyle: TextStyle(
      color: lightWhiteText,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    elevation: 8,
  ),
  colorScheme: const ColorScheme.dark(
    primary: darkAccentBlue,
    secondary: darkAccentYellow,
    background: darkBackground,
    surface: darkCardBackground,
    onPrimary: lightWhiteText,
    onSecondary: darkAccentGrey,
    onBackground: lightWhiteText,
    onSurface: lightWhiteText,
  ),
  iconTheme: const IconThemeData(color: darkAccentYellow),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: lightWhiteText),
    bodyMedium: TextStyle(color: lightWhiteText),
    titleLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: lightWhiteText),
    titleMedium: TextStyle(fontSize: 18, color: lightWhiteText),
  ),
);

const TextStyle titleStyle =
    TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
const TextStyle subtitleStyle = TextStyle(fontSize: 18);
const TextStyle buttonTextStyle = TextStyle(fontSize: 18);
