import 'package:flutter/material.dart';

class WriteButton extends StatelessWidget {
  const WriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.25),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 85, 142, 241),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        iconSize: 35,
        onPressed: () {},
        icon: const Icon(
          Icons.draw,
          color: Colors.white,
        ),
      ),
    );
  }
}
