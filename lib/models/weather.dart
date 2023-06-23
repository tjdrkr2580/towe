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
  final double feels;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Weather(this.feels, this.temp, this.tempMin, this.tempMax, this.pressure,
      this.humidity);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(json['feels'], json['temp'], json['tempMin'],
        json['tempMax'], json['pressure'], json['humidity']);
  }
}
