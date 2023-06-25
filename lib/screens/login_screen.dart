import 'package:flutter/material.dart';
import 'package:towe/widgets/towe_appbar.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToweAppBar(isMenu: false),
      body: Container(
        child: const Text("안녕"),
      ),
    );
  }
}
