import 'package:flutter/material.dart';
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

          final appBarColor = Theme.of(context).appBarTheme.backgroundColor ??
              Theme.of(context).colorScheme.primary;
          return LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 600;
              final tempFontSize = isWide ? 66.0 : 44.0;
              final iconSize = isWide ? 120.0 : 90.0;
              final titleFontSize = isWide ? 22.0 : 18.0;
              final descFontSize = isWide ? 20.0 : 16.0;
              final padding = isWide ? 32.0 : 16.0;
              final ciudadWidget = Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      ciudad.ciudad,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.location_on, size: 22),
                  const SizedBox(width: 4),
                ],
              );
              final fecha =
                  DateTime.fromMillisecondsSinceEpoch(current.dt * 1000)
                      .toLocal();
              final fechaStr =
                  "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}";
              final horaStr = fecha.toString().split(" ")[1].substring(0, 5);
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 8,
                    backgroundColor: appBarColor,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 22),
                            const SizedBox(width: 4),
                            Text(
                              ciudad.ciudad,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        if (themeSwitch != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: themeSwitch,
                          ),
                      ],
                    ),
                    centerTitle: false,
                  ),
                ),
                body: SingleChildScrollView(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(currentIcon,
                              width: iconSize, height: iconSize),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${current.temp.round()}°',
                                style: TextStyle(
                                  fontSize: tempFontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${current.description[0].toUpperCase()}${current.description.substring(1)}',
                                style: TextStyle(fontSize: descFontSize),
                              ),
                              Text(
                                  'Sensación térmica ${current.feelsLike.round()}°'),
                            ],
                          )
                        ],
                      ),
                      // Pronóstico por hora (scroll horizontal)
                      const SizedBox(height: 20),
                      const Text(
                        'Pronóstico por hora',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                      HourlyForecastList(hourly: clima.hourly),

                      // Pronóstico diario (scroll vertical)
                      const SizedBox(height: 20),
                      const Text(
                        'Pronóstico semanal',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                      DailyForecastList(daily: clima.daily),
                      // Destacados del clima
                      const SizedBox(height: 20),
                      const Text(
                        'Información adicional',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      WeatherHighlights(
                        humidity: current.humidity,
                        windSpeed: current.windSpeed,
                        uvIndex: current.uvi.round(),
                        uvLabel: _uvLabel(current.uvi),
                        sunrise: _formatHour(current.sunrise),
                        sunset: _formatHour(current.sunset),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          'Actualizado: $fechaStr $horaStr',
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
