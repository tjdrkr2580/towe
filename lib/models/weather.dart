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
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;

  Weather(this.feels_like, this.temp, this.temp_min, this.temp_max,
      this.pressure, this.humidity);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(json['temp'], json['feels_like'], json['temp_min'],
        json['temp_max'], json['pressure'], json['humidity']);
  }
}
