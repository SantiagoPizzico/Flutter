// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/themes/dark_theme.dart';
import 'package:weather_app/themes/light_theme.dart';
import 'package:weather_app/widgets/theme_switch.dart';
import 'package:weather_app/providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Clima App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,
      home: WeatherScreen(
        themeSwitch: ThemeSwitch(
          isDark: themeProvider.themeMode == ThemeMode.dark,
          onChanged: (_) => themeProvider.toggleTheme(),
        ),
      ),
    );
  }
}
