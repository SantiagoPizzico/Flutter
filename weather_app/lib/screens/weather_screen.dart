import 'dart:ui';

import 'package:flutter/material.dart';
import '../themes/dark_theme.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/hourly_forecast_list.dart';
import '../widgets/daily_forecast_list.dart';
import '../widgets/weather_highlights.dart';

class WeatherScreen extends StatelessWidget {
  final Widget? themeSwitch;

  const WeatherScreen({Key? key, this.themeSwitch}) : super(key: key);
  String _uvLabel(double uvi) {
    if (uvi < 3) return 'Bajo';
    if (uvi < 6) return 'Moderado';
    if (uvi < 8) return 'Alto';
    if (uvi < 11) return 'Muy alto';
    return 'Extremo';
  }

  String _formatHour(int timestamp) {
    final dt = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return dt.toLocal().toString().substring(11, 16);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider()..fetchWeather(),
      child: Consumer<WeatherProvider>(
        builder: (context, provider, _) {
          if (provider.loading) {
            return Scaffold(
              appBar: AppBar(title: const Text('Cargando...')),
              body: const Center(child: CircularProgressIndicator()),
            );
          }
          if (provider.clima == null || provider.ciudad == null) {
            return Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: const Center(child: Text('No se pudo obtener el clima')),
            );
          }
          final clima = provider.clima!;
          final ciudad = provider.ciudad!;
          final current = clima.current;
          final currentIcon = 'assets/icons/${current.icon}.png';

          final colorScheme = Theme.of(context).colorScheme;
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: AppBar(
                automaticallyImplyLeading: false,
                elevation: 8,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [colorScheme.primary, colorScheme.secondary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
                title: const Text(
                  'Clima',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                actions: [
                  if (themeSwitch != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: themeSwitch,
                    ),
                ],
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ciudad: ${ciudad.ciudad}',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Fecha: ${DateTime.fromMillisecondsSinceEpoch(current.dt * 1000).toLocal().toString().split(" ")[0]}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Hora: ${DateTime.fromMillisecondsSinceEpoch(current.dt * 1000).toLocal().toString().split(" ")[1].substring(0, 5)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Image.asset(currentIcon, width: 80, height: 80),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ahora: ${current.description}',
                              style: const TextStyle(fontSize: 20)),
                          Text('Temperatura: ${current.temp.round()}°C'),
                          Text(
                              'Sensación térmica: ${current.feelsLike.round()}°C'),
                        ],
                      )
                    ],
                  ),
                  // Pronóstico por hora (scroll horizontal)
                  const SizedBox(height: 20),
                  const Text('Pronóstico por hora:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  HourlyForecastList(hourly: clima.hourly),

                  // Pronóstico diario (scroll vertical)
                  const SizedBox(height: 20),
                  const Text('Pronóstico semanal:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  DailyForecastList(daily: clima.daily),
                  // Destacados del clima
                  const SizedBox(height: 20),
                  WeatherHighlights(
                    humidity: current.humidity,
                    windSpeed: current.windSpeed,
                    uvIndex: current.uvi.round(),
                    uvLabel: _uvLabel(current.uvi),
                    sunrise: _formatHour(current.sunrise),
                    sunset: _formatHour(current.sunset),
                  ),

                  // Alertas (si existen)
                  if (clima.alerts.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const Text('Alertas climáticas:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                    ...clima.alerts.map((a) => Card(
                          color: Colors.red[50],
                          child: ListTile(
                            title: Text(a.event),
                            subtitle: Text(a.description ?? 'Sin descripción'),
                          ),
                        )),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
