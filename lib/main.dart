import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:towe/screens/home_screen.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  runApp(const Towe());
}

class Towe extends StatelessWidget {
  const Towe({super.key});

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(7.25),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 108, 162, 255),
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  Icons.draw,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
