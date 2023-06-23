import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:towe/service/network_helper.dart';

class WeatherService {
  final String apiUrl = dotenv.env['WEATHER_APIURL']!;
  final String apiKey = dotenv.env['WEATHER_APIKEY']!;

  Future fetchWeather(double lat, double lon) async {
    final response = await NetworkHelper()
        .getData('$apiUrl?lat=$lat&lon=$lon&appid=$apiKey');
    return response;
  }
}
