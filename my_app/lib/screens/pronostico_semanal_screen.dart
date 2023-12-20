// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:my_app/models/clima.dart';
import 'package:my_app/widgets/detalle_dia_widget.dart';
import 'package:my_app/themes/theme.dart';

class PronosticoSemanalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Clima clima = ModalRoute.of(context)!.settings.arguments as Clima;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronóstico semanal'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[50],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                //widget reutilizable para ver registro unico
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallesDiaScreen(
                      clima: clima,
                      index: index,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${clima.fecha.add(Duration(days: index)).toString().split(" ")[0]}',
                            style: subtitleStyle,
                          ),
                          const SizedBox(height: 4),
                          buildTemperatureRow(
                              'Máx:', clima.temperaturaMaxima[index]),
                          buildTemperatureRow(
                              'Mín:', clima.temperaturaMinima[index]),
                        ],
                      ),
                      Icon(
                        _getIconoClima(clima.cielo),
                        size: 50,
                        color: _getColorIconoClima(clima.cielo),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
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
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
