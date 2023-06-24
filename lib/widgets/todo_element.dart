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
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 129, 175, 255),
          borderRadius: BorderRadius.circular(8)),
      height: 160,
      child: const Row(children: []),
    );
  }
}
