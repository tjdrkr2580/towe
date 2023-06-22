class Weather {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;

  Weather(this.feels_like, this.temp_max, this.temp_min, this.pressure,
      this.humidity, this.temp);
}
