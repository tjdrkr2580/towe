import 'dart:async';

import 'package:flutter/material.dart';
import 'package:towe/screens/home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "하루를 날씨와 연결하다.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Towe.",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
