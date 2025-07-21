import 'package:flutter/material.dart';

final Color darkBackground = Color(0xFF18191A);
final Color darkCardBackground = Color(0xFF23272A);
final Color darkAccentYellow = Color(0xFFFFC300);
final Color darkAccentGrey = Color(0xFFB0B3B8);
final Color darkAccentWhite = Color(0xFFF5F6FA);
final Color darkAccentBlue = Color(0xFF1976D2);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBackground,
  cardColor: darkCardBackground,
  primaryColor: darkAccentBlue,
  appBarTheme: AppBarTheme(
    backgroundColor: darkCardBackground,
    iconTheme: const IconThemeData(color: Color(0xFFFFC300)),
    titleTextStyle: const TextStyle(
      color: Color(0xFFF5F6FA),
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    elevation: 8,
  ),
  colorScheme: ColorScheme.dark(
    primary: darkAccentBlue,
    secondary: darkAccentYellow,
    background: darkBackground,
    surface: darkCardBackground,
    onPrimary: darkAccentWhite,
    onSecondary: darkAccentGrey,
    onBackground: darkAccentWhite,
    onSurface: darkAccentWhite,
  ),
  iconTheme: const IconThemeData(color: Color(0xFFFFC300)),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFF5F6FA)),
    bodyMedium: TextStyle(color: Color(0xFFF5F6FA)),
    titleLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFF5F6FA)),
    titleMedium: TextStyle(fontSize: 18, color: Color(0xFFF5F6FA)),
  ),
);

const TextStyle titleStyle =
    TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
const TextStyle subtitleStyle = TextStyle(fontSize: 18);
const TextStyle buttonTextStyle = TextStyle(fontSize: 18);
