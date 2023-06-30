import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:towe/screens/home_screen.dart';
import 'package:towe/service/todo_service.dart';
import 'package:towe/widgets/towe_appbar.dart';

class PatchScreen extends StatefulWidget {
  const PatchScreen({
    super.key,
    required this.title,
    required this.todoId,
    required this.content,
    required this.priority,
    required this.subTitle,
    required this.checked,
  });
  final int todoId;
  final String title;
  final String subTitle;
  final String content;
  final int priority;
  final bool checked;
  @override
  State<PatchScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PatchScreen> {
  String? _title;
  String? _subTitle;
  String? _content;
  int? _priority;
  int? _todoId;
  bool? _checked;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _subTitle = widget.subTitle;
    _content = widget.content;
    _priority = widget.priority;
    _todoId = widget.todoId;
    _checked = widget.checked;
  }

  final _formKey = GlobalKey<FormState>();

  Future<void> onPostTodo() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      bool response = await TodoService().patchTodo(_todoId, {
        'priority': _priority,
        'title': _title,
        'subTitle': _subTitle,
        'content': _content,
        'checked': _checked
      });
      if (response == true) {
        if (!mounted) return;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
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
                      initialValue: _title,
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
                      initialValue: _subTitle,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        hintText: "요약",
                      ),
                      onSaved: (String? value) {
                        _subTitle = value;
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
                      initialValue: _priority.toString(),
                      maxLength: 1,
                      decoration: const InputDecoration(
                        hintText: "중요도 (숫자 1 ~ 5)",
                      ),
                      onSaved: (String? value) {
                        _priority = int.parse(value!);
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
                        initialValue: _content,
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
                        "수정하기",
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
