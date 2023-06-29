import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:towe/service/todo_service.dart';
import 'package:towe/widgets/towe_appbar.dart';

class TodoEditScreen extends StatefulWidget {
  const TodoEditScreen({super.key});
  @override
  State<TodoEditScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoEditScreen> {
  String? _title = "";
  String? _subtitle = "";
  String? _content = "";
  String? _priority;
  final _formKey = GlobalKey<FormState>();

  Future<void> onPostTodo() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      Response? response =
          await TodoService().postTodo(_priority, _title, _subtitle, _content);
      if (response == null) {
        print("요청 실패");
      } else {
        if (!mounted) return;
        Navigator.pop(context);
      }
    }
  }

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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 40),
                    TextFormField(
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        hintText: "제목",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "제목을 입력해주세요";
                        } else if (value.length < 3) {
                          return "제목을 3자 이상 이어야합니다.";
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _title = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        hintText: "요약",
                      ),
                      onSaved: (String? value) {
                        _subtitle = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "요약을 입력해주세요";
                        } else if (value.length < 3) {
                          return "요약은 3자 이상이어야 합니다.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      maxLength: 1,
                      decoration: const InputDecoration(
                        hintText: "중요도 (숫자 1 ~ 5)",
                      ),
                      onSaved: (String? value) {
                        _priority = value;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (String? value) {
                        if (value == null || value == "") {
                          return "1 ~ 5까지의 값을 입력해주세요";
                        } else {
                          int? parsedValue = int.tryParse(value);
                          if (parsedValue != null && parsedValue >= 6) {
                            return "1 ~ 5까지의 값을 입력해주세요";
                          } else if (parsedValue != null && parsedValue <= 0) {
                            return "1 ~ 5까지의 값을 입력해주세요";
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 150,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 16),
                        maxLength: 30,
                        maxLines: 3,
                        onSaved: (String? value) {
                          _content = value;
                        },
                        decoration: const InputDecoration(
                            hintText: "본문", border: InputBorder.none),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "본문을 입력해주세요";
                          } else if (value.length < 3) {
                            return "본문은 3자 이상이어야 합니다.";
                          }
                          return null;
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: onPostTodo,
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(14)),
                      child: const Text(
                        "추가하기",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
