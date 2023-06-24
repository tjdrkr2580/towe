import 'package:flutter/material.dart';

class TodoElement extends StatefulWidget {
  const TodoElement({super.key});

  @override
  State<TodoElement> createState() => _TodoElementState();
}

class _TodoElementState extends State<TodoElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 112, 164, 255),
          borderRadius: BorderRadius.circular(8)),
      height: 110,
      child:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Flutter로 TodoList 레이아웃 잡기",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "1",
              style: TextStyle(
                color: Color.fromARGB(255, 212, 218, 255),
                fontSize: 20,
              ),
            ),
          ],
        ),
        Text(
          "되도록이면 오늘 안에 마치면 좋을 것 같다. 히히",
          style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 233, 233, 233)),
        ),
      ]),
    );
  }
}
