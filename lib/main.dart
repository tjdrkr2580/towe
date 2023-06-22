import 'package:flutter/material.dart';
import 'package:towe/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Towe.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              textAlign: TextAlign.left,
            ),
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_box,
                  ),
                  splashRadius: 18,
                  iconSize: 25,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                  splashRadius: 18,
                  iconSize: 25,
                ),
              ],
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
