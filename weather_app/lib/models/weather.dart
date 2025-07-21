import 'dart:convert';

ClimaResponse climaResponseFromJson(String str) =>
    ClimaResponse.fromJson(json.decode(str));

class ClimaResponse {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final CurrentWeather current;
  final List<HourlyWeather> hourly;
  final List<DailyWeather> daily;
  final List<AlertWeather> alerts;

  ClimaResponse({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
    required this.alerts,
  });

  factory ClimaResponse.fromJson(Map<String, dynamic> json) => ClimaResponse(
        lat: (json["lat"] as num).toDouble(),
        lon: (json["lon"] as num).toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: CurrentWeather.fromJson(json["current"]),
        hourly: (json["hourly"] as List)
            .map((x) => HourlyWeather.fromJson(x))
            .toList(),
        daily: (json["daily"] as List)
            .map((x) => DailyWeather.fromJson(x))
            .toList(),
        alerts: json["alerts"] != null
            ? (json["alerts"] as List)
                .map((x) => AlertWeather.fromJson(x))
                .toList()
            : [],
      );
}

class CurrentWeather {
  // Getter para mostrar el viento en km/h
  double get windSpeedKmh => windSpeed * 3.6;
  final int sunrise;
  final int sunset;
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final String main;
  final String description;
  final String icon;

  CurrentWeather({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.main,
    required this.description,
    required this.icon,
    required this.sunrise,
    required this.sunset,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        dt: json["dt"],
        temp: (json["temp"] as num).toDouble(),
        feelsLike: (json["feels_like"] as num).toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        uvi: (json["uvi"] as num).toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: (json["wind_speed"] as num).toDouble(),
        windDeg: json["wind_deg"],
        main: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        icon: json["weather"][0]["icon"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
}

class HourlyWeather {
  // Getter para mostrar el viento en km/h
  double get windSpeedKmh => windSpeed * 3.6;
  final int dt;
  final double temp;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final String main;
  final String description;
  final String icon;

  HourlyWeather({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) => HourlyWeather(
        dt: json["dt"],
        temp: (json["temp"] as num).toDouble(),
        feelsLike: (json["feels_like"] as num).toDouble(),
        humidity: json["humidity"],
        windSpeed: (json["wind_speed"] as num).toDouble(),
        main: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        icon: json["weather"][0]["icon"],
      );
}

class DailyWeather {
  final int dt;
  final double min;
  final double max;
  final double day;
  final int humidity;
  final double windSpeed;
  final String main;
  final String description;
  final String icon;

  DailyWeather({
    required this.dt,
    required this.min,
    required this.max,
    required this.day,
    required this.humidity,
    required this.windSpeed,
    required this.main,
    required this.description,
    required this.icon,
  });

  // Getter para mostrar el viento en km/h redondeado
  int get windSpeedKmh => (windSpeed * 3.6).round();

  factory DailyWeather.fromJson(Map<String, dynamic> json) => DailyWeather(
        dt: json["dt"],
        min: (json["temp"]["min"] as num).toDouble(),
        max: (json["temp"]["max"] as num).toDouble(),
        day: (json["temp"]["day"] as num).toDouble(),
        humidity: json["humidity"],
        windSpeed: (json["wind_speed"] as num).toDouble(),
        main: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        icon: json["weather"][0]["icon"],
      );
}

class AlertWeather {
  final String event;
  final String? description;

  AlertWeather({
    required this.event,
    this.description,
  });

  factory AlertWeather.fromJson(Map<String, dynamic> json) => AlertWeather(
        event: json["event"],
        description: json["description"],
      );
}
