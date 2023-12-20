class Clima {
  String ciudad;
  int temperatura;
  int humedad;
  int viento;
  String cielo;
  DateTime fecha;
  List<int> temperaturaMaxima;
  List<int> temperaturaMinima;

  Clima({
    required this.ciudad,
    required this.temperatura,
    required this.humedad,
    required this.viento,
    required this.cielo,
    required this.fecha,
    required this.temperaturaMaxima,
    required this.temperaturaMinima,
  });

  static List<Clima> climas = [
    Clima(
      ciudad: 'Buenos Aires',
      temperatura: 25,
      humedad: 60,
      viento: 10,
      cielo: 'Soleado',
      fecha: DateTime.now(),
      temperaturaMaxima: [30, 32, 28, 29, 31, 33, 30],
      temperaturaMinima: [15, 18, 14, 16, 17, 19, 15],
    ),
    Clima(
      ciudad: 'Córdoba',
      temperatura: 28,
      humedad: 70,
      viento: 12,
      cielo: 'Nublado',
      fecha: DateTime.now(),
      temperaturaMaxima: [32, 34, 30, 31, 33, 35, 32],
      temperaturaMinima: [18, 20, 16, 17, 19, 21, 18],
    ),
    Clima(
      ciudad: 'Mar del Plata',
      temperatura: 22,
      humedad: 80,
      viento: 8,
      cielo: 'Lluvia',
      fecha: DateTime.now(),
      temperaturaMaxima: [28, 30, 26, 27, 29, 31, 28],
      temperaturaMinima: [14, 16, 12, 14, 15, 17, 14],
    ),
  ];

  static Clima getClimaPorCiudad(String ciudad) {
    return climas.firstWhere((clima) => clima.ciudad == ciudad);
  }
}
