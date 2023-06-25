import 'package:flutter/material.dart';

class TodoElement extends StatefulWidget {
  const TodoElement({super.key});

  @override
  State<TodoElement> createState() => _TodoElementState();
}

class _TodoElementState extends State<TodoElement> {
  bool isBool = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 112, 164, 255),
          borderRadius: BorderRadius.circular(8)),
      height: 110,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(
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
            Padding(
              padding: EdgeInsets.only(right: 22.5),
              child: Text(
                "1",
                style: TextStyle(
                  color: Color.fromARGB(255, 212, 218, 255),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        const Text(
          "되도록이면 오늘 안에 마치면 좋을 것 같다. 히히",
          style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 233, 233, 233)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.scale(
                scale: 1.25,
                child: Checkbox(
                    value: isBool,
                    onChanged: (bool? value) {
                      setState(() {
                        isBool = value!;
                      });
                    })),
          ],
        )
      ]),
    );
  }
}
