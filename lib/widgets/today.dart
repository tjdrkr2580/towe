import 'package:flutter/material.dart';

class TodayWidget extends StatelessWidget {
  const TodayWidget({super.key});

  String dateFormat() {
    DateTime date = DateTime.now();
    return date.toString().substring(0, 10);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 7),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            dateFormat(),
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
