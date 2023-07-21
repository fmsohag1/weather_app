// To parse this JSON data, do
//
//     final currentWeatherData = currentWeatherDataFromJson(jsonString);

import 'dart:convert';

CurrentWeatherData currentWeatherDataFromJson(String str) => CurrentWeatherData.fromJson(json.decode(str));

//String currentWeatherDataToJson(CurrentWeatherData data) => json.encode(data.toJson());

class CurrentWeatherData {
  List<Weather> weather;
  Main main;
  Wind wind;
  Clouds clouds;
  int dt;
  String name;

  CurrentWeatherData({
    required this.weather,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.name,
  });

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) => CurrentWeatherData(
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    main: Main.fromJson(json["main"]),
    wind: Wind.fromJson(json["wind"]),
    clouds: Clouds.fromJson(json["clouds"]),
    dt: json["dt"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "main": main.toJson(),
    "wind": wind.toJson(),
    "clouds": clouds.toJson(),
    "dt": dt,
    "name": name,
  };
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}


class Main {
  int temp;
  int tempMin;
  int tempMax;
  int humidity;
  int seaLevel;
  int grndLevel;

  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"]?.toInt(),
    tempMin: json["temp_min"]?.toInt(),
    tempMax: json["temp_max"]?.toInt(),
    humidity: json["humidity"],
    seaLevel: json["sea_level"],
    grndLevel: json["grnd_level"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "humidity": humidity,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
  };
}


class Weather {
  String main;
  String icon;

  Weather({
    required this.main,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    main: json["main"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "main": main,
    "icon": icon,
  };
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"]?.toDouble(),
    deg: json["deg"],
    gust: json["gust"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
}
