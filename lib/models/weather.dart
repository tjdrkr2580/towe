// "main": {
//     "temp": 298.48,
//     "feels_like": 298.74,
//     "temp_min": 297.56,
//     "temp_max": 300.05,
//     "pressure": 1015,
//     "humidity": 64,
//   },

class Weather {
  final double temp;
  // ignore: non_constant_identifier_names
  final double feels_like;
  // ignore: non_constant_identifier_names
  final double temp_min;
  // ignore: non_constant_identifier_names
  final double temp_max;
  final int humidity;

  Weather(
      this.feels_like, this.temp, this.temp_min, this.temp_max, this.humidity);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(json['temp'], json['feels_like'], json['temp_min'],
        json['temp_max'], json['humidity']);
  }
}
