// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/pronostico_dia_screen.dart';
import 'package:my_app/screens/pronostico_semanal_screen.dart';
import 'package:my_app/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima App',
      theme: appTheme,
      routes: {
        '/home': (context) => HomeScreen(),
        '/pronostico_dia': (context) => PronosticoDiaScreen(),
        '/pronostico_semanal': (context) => PronosticoSemanalScreen(),
      },
      initialRoute: '/home',
    );
  }
}
