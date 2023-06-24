import 'package:flutter/material.dart';

class TodayWidget extends StatelessWidget {
  const TodayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 7),
      alignment: Alignment.topLeft,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "2023. 06. 24. Sat",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
