import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:towe/provider/towe_provider.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const MaterialApp(
          home: Scaffold(
        body: LandingScreen(),
        drawer: Drawer(),
      )),
    );
  }
}
