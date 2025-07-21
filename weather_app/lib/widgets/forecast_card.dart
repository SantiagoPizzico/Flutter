import 'package:flutter/material.dart';
import '../themes/dark_theme.dart';

class ForecastCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final String humidity;
  final String windSpeed;

  const ForecastCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(iconPath, width: 40, height: 40),
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.water_drop, color: Colors.lightBlueAccent, size: 20),
                const SizedBox(width: 4),
                Text(
                  humidity,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/windSpeed.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  windSpeed,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
