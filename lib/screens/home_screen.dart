import 'package:flutter/material.dart';
import 'package:towe/widgets/today.dart';
import 'package:towe/widgets/todo_element.dart';
import 'package:towe/widgets/towe_appbar.dart';
import 'package:towe/widgets/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const ToweAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 30),
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
              ),
              const TodayWidget(),
              Expanded(
                child: ListView.separated(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const TodoElement();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
