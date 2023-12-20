// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:my_app/models/clima.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ciudadSeleccionada = 'Buenos Aires';

  @override
  Widget build(BuildContext context) {
    Clima climaActual = Clima.getClimaPorCiudad(ciudadSeleccionada);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 202, 252),
      appBar: AppBar(
        title: const Text(
          'Clima',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 201, 202, 252),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Seleccione ciudad',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300], // Color de fondo del título
                borderRadius: BorderRadius.circular(8), // Bordes redondeados
              ),
              padding: const EdgeInsets.all(16),
              child: DropdownButton<String>(
                value: ciudadSeleccionada,
                items: const [
                  DropdownMenuItem(
                    value: 'Buenos Aires',
                    child: Center(child: Text('Buenos Aires')),
                  ),
                  DropdownMenuItem(
                    value: 'Córdoba',
                    child: Center(child: Text('Córdoba')),
                  ),
                  DropdownMenuItem(
                    value: 'Mar del Plata',
                    child: Center(child: Text('Mar del Plata')),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    ciudadSeleccionada = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/pronostico_dia',
                  arguments: climaActual,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 100, 142),
              ),
              child: const Center(
                child: Text(
                  'Pronóstico del día',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/pronostico_semanal',
                  arguments: climaActual,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 100, 142),
              ),
              child: const Center(
                child: Text(
                  'Pronóstico semanal',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
