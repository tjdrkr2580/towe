import 'package:flutter/material.dart';
import 'package:towe/widgets/sized_box_30.dart';
import 'package:towe/widgets/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBoxThirty(),
        Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade300, Colors.blue.shade500],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: const WeatherWidget(),
        )
      ],
    );
  }
}
