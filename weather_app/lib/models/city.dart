class CiudadResponse {
  final String ciudad;

  CiudadResponse({required this.ciudad});

  factory CiudadResponse.fromJson(Map<String, dynamic> json) {
    return CiudadResponse(
      ciudad: json['ciudad'] ?? 'Desconocida',
    );
  }
}
