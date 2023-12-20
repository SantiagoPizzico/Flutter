// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:my_app/models/clima.dart';
import 'package:my_app/themes/theme.dart';

class PronosticoDiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Clima clima = ModalRoute.of(context)!.settings.arguments as Clima;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronóstico del día'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getIconoClima(clima.cielo),
                size: 50,
                color: _getColorIconoClima(clima.cielo),
              ),
              Text(
                'Ciudad: ${clima.ciudad}',
                style: titleStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'Fecha: ${clima.fecha.toString().split(" ")[0]}',
                style: subtitleStyle,
              ),
              const SizedBox(height: 32),
              buildTemperatureRow(
                  'Temperatura máxima:', clima.temperaturaMaxima[0]),
              const SizedBox(height: 8),
              buildTemperatureRow(
                  'Temperatura mínima:', clima.temperaturaMinima[0]),
              const SizedBox(height: 32),
              Text(
                'Cielo: ${clima.cielo}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Volver', style: buttonTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTemperatureRow(String label, int temperature) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: subtitleStyle,
        ),
        const SizedBox(width: 8),
        Text(
          '$temperature°C',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

IconData _getIconoClima(String? cielo) {
  if (cielo == 'Soleado') {
    return Icons.wb_sunny;
  } else if (cielo == 'Nublado') {
    return Icons.cloud;
  } else if (cielo == 'Lluvia') {
    return Icons.umbrella;
  } else {
    return Icons.cloud_circle;
  }
}

Color _getColorIconoClima(String? cielo) {
  if (cielo == 'Soleado') {
    return Colors.yellow;
  } else if (cielo == 'Nublado') {
    return Colors.grey;
  } else if (cielo == 'Lluvia') {
    return Colors.blue;
  } else {
    return Colors.grey;
  }
}
