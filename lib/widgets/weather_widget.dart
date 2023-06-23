import 'package:flutter/material.dart';
import 'package:towe/service/location.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WeatherWidget> {
  @override
  void initState() {
    MyLocation.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}
