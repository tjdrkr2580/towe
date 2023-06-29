import 'package:flutter/material.dart';

class TodoElement extends StatefulWidget {
  TodoElement(this.checked, this.subTitle, this.title, this.priority,
      {super.key});

  String title;
  String subTitle;
  int priority;
  bool checked;

  @override
  State<TodoElement> createState() => _TodoElementState();
}

class _TodoElementState extends State<TodoElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 112, 164, 255),
          borderRadius: BorderRadius.circular(8)),
      height: 110,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22.5),
              child: Text(
                widget.priority.toString(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 212, 218, 255),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        Text(
          widget.subTitle,
          style: const TextStyle(
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
                    value: widget.checked, onChanged: (bool? value) {})),
          ],
        )
      ]),
    );
  }
}
