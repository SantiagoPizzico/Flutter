import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';
import '../models/city.dart';

class ClimaService {
  final String baseUrl = 'http://localhost:3000/api/v1/clima';

  Future<ClimaResponse> getClimaPorUbicacion(double lat, double lon) async {
    final url = Uri.parse('$baseUrl/actual/ubicacion?lat=$lat&lon=$lon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ClimaResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener el clima');
    }
  }

  Future<CiudadResponse> getCiudadPorUbicacion(double lat, double lon) async {
    final url = Uri.parse('$baseUrl/ciudad/ubicacion?lat=$lat&lon=$lon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return CiudadResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener la ciudad');
    }
  }
}
