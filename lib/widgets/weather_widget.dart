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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "현재 온도",
                  style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${(snapshot.data!.temp - 273.15).toStringAsFixed(2)}°C',
                  style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "최고 온도",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${(snapshot.data!.temp_max - 273.15).toStringAsFixed(2)}°C',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "최저 온도",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${(snapshot.data!.temp_min - 273.15).toStringAsFixed(2)}°C',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "체감 온도",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${(snapshot.data!.feels_like - 273.15).toStringAsFixed(2)}°C',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "최저 온도",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${(snapshot.data!.temp_min - 273.15).toStringAsFixed(2)}°C',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "습도",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${(snapshot.data!.humidity)}%',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 211, 195, 255),
              ),
            );
          }
        });
  }
}
