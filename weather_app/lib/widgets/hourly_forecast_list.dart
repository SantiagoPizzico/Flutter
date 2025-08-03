import 'package:flutter/material.dart';

class HourlyForecastList extends StatelessWidget {
  final List<dynamic> hourly;

  const HourlyForecastList({super.key, required this.hourly});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: hourly.length > 24 ? 24 : hourly.length,
        itemBuilder: (context, index) {
          final h = hourly[index];
          final dt = DateTime.fromMillisecondsSinceEpoch(h.dt * 1000);
          final hIcon = 'assets/icons/${h.icon}.png';
          final cardColor = Theme.of(context).cardColor;
          return Container(
            width: 100,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text('${dt.hour}:00',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold)),
                Image.asset(hIcon, width: 50, height: 50),
                Text('${h.temp.round()}°C',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary)),
                const Icon(Icons.water_drop,
                    color: Colors.lightBlueAccent, size: 20),
                Text('${h.humidity}%',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface)),
              ],
            ),
          );
        },
      ),
    );
  }
}
