import 'package:flutter/material.dart';
import '../widgets/forecast_card.dart';

class DailyForecastList extends StatelessWidget {
  final List<dynamic> daily;

  const DailyForecastList({super.key, required this.daily});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: daily.length,
      itemBuilder: (context, index) {
        final d = daily[index];
        final dt = DateTime.fromMillisecondsSinceEpoch(d.dt * 1000);
        final dIcon = 'assets/icons/${d.icon}.png';
        return ForecastCard(
          iconPath: dIcon,
          title: '${dt.day}/${dt.month} - ${d.description}',
          subtitle: 'Mín: ${d.min.round()}°C | Máx: ${d.max.round()}°C',
          humidity: '${d.humidity}%',
          windSpeed: '${d.windSpeed} m/s',
        );
      },
    );
  }
}
