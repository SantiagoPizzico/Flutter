import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather.dart';
import '../models/city.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final ClimaService _climaService = ClimaService();

  ClimaResponse? clima;
  CiudadResponse? ciudad;
  bool loading = false;

  Future<void> fetchWeather() async {
    loading = true;
    notifyListeners();

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final lat = position.latitude;
      final lon = position.longitude;

      clima = await _climaService.getClimaPorUbicacion(lat, lon);
      ciudad = await _climaService.getCiudadPorUbicacion(lat, lon);
    } catch (e) {
      clima = null;
      ciudad = null;
      print('Error fetching weather data: $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
