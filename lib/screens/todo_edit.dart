import 'package:flutter/material.dart';
import 'package:towe/widgets/towe_appbar.dart';

class TodoEditScreen extends StatefulWidget {
  const TodoEditScreen({super.key});
  @override
  State<TodoEditScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoEditScreen> {
  String? title;
  String? desc;
  String? content;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToweAppBar(isMenu: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    TextFormField(
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        hintText: "제목",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        hintText: "요약",
                      ),
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 16),
                      decoration:
                          const InputDecoration(hintText: "본문", border: null),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
