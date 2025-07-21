import 'package:flutter/material.dart';
import '../themes/dark_theme.dart';

class WeatherHighlights extends StatelessWidget {
  final int humidity;
  final double windSpeed;
  final int uvIndex;
  final String uvLabel;
  final String sunrise;
  final String sunset;

  const WeatherHighlights({
    super.key,
    required this.humidity,
    required this.windSpeed,
    required this.uvIndex,
    required this.uvLabel,
    required this.sunrise,
    required this.sunset,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _HighlightCard(
          assetIcon: 'assets/icons/uvi.png',
          iconColor: colorScheme.secondary,
          title: 'Índice UV',
          value: uvLabel,
        ),
        _HighlightCard(
          icon: Icons.water_drop,
          iconColor: Colors.lightBlueAccent,
          title: 'Humedad',
          value: '$humidity %',
        ),
        _HighlightCard(
          assetIcon: 'assets/icons/wind.png',
          iconColor: colorScheme.onSurface,
          title: 'Viento',
          value: '${(windSpeed * 3.6).round()} km/h',
        ),
        _SunCard(sunrise: sunrise, sunset: sunset),
      ],
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final IconData? icon;
  final String? assetIcon;
  final Color iconColor;
  final String title;
  final String value;

  const _HighlightCard({
    this.icon,
    this.assetIcon,
    required this.iconColor,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (assetIcon != null)
            Image.asset(assetIcon!, width: 36, height: 36, color: iconColor)
          else if (icon != null)
            Icon(icon, color: iconColor, size: 36),
          const SizedBox(height: 8),
          Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: colorScheme.onPrimary)),
          const SizedBox(height: 8),
          Text(value,
              style: TextStyle(fontSize: 20, color: colorScheme.onSurface)),
        ],
      ),
    );
  }
}

class _SunCard extends StatelessWidget {
  final String sunrise;
  final String sunset;

  const _SunCard({required this.sunrise, required this.sunset});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/sunrise.png',
                    width: 28, height: 28, color: colorScheme.secondary),
                const SizedBox(height: 8),
                Text('Salida del sol',
                    style: TextStyle(color: colorScheme.onPrimary)),
                Text(sunrise, style: TextStyle(color: colorScheme.onSurface)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/sunset.png',
                    width: 28, height: 28, color: Colors.pinkAccent),
                const SizedBox(height: 8),
                Text('Atardecer',
                    style: TextStyle(color: colorScheme.onPrimary)),
                Text(sunset, style: TextStyle(color: colorScheme.onSurface)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
