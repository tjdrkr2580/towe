class Weather {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int humidity;
  Weather(
      this.temp, this.feels_like, this.temp_min, this.temp_max, this.humidity);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      json['temp'],
      json['feels_like'],
      json['temp_min'],
      json['temp_max'],
      json['humidity'],
    );
  }
}
