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
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          clima = null;
          ciudad = null;
          loading = false;
          notifyListeners();
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        clima = null;
        ciudad = null;
        loading = false;
        notifyListeners();
        return;
      }
      // Si llegaste aquí, tienes permiso
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
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
