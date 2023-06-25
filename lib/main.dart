import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:towe/screens/landing_screen.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  runApp(const Towe());
}

class Towe extends StatefulWidget {
  const Towe({super.key});

  @override
  State<Towe> createState() => _ToweState();
}

class _ToweState extends State<Towe> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: LandingScreen(),
    ));
  }
}
