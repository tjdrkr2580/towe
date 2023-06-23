import 'package:flutter/material.dart';
import 'package:towe/models/weather.dart';
import 'package:towe/service/location.dart';
import 'package:towe/service/weather_service.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WeatherWidget> {
  Future<Weather>? weatherInfo;

  @override
  void initState() {
    super.initState();
    weatherInfo = getWeather();
  }

  Future<Weather> getWeather() async {
    List<double>? positionList = await MyLocation.getCurrentLocation();
    if (positionList != null) {
      Map<String, dynamic> weatherData =
          await WeatherService().fetchWeather(positionList[0], positionList[1]);
      return Weather.fromJson(weatherData['main']);
    } else {
      throw Exception('Failed to get location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: weatherInfo,
        builder: (context, AsyncSnapshot<Weather> snapshot) {
          if (snapshot.hasData == true) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("현재 기온"),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
