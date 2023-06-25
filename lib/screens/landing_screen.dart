import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

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
