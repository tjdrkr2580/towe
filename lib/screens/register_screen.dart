import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:intl/intl.dart';
import 'package:towe/service/ragexp_patteurn.dart';
import 'package:towe/service/user_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedDate = "";
  String _memberName = "";
  String _password = "";
  String _nickname = "";
  String _email = "";
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
  }

  Future _selectDate(BuildContext context) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        _selectedDate = formatter.format(selected);
        _dateController.text = _selectedDate;
      });
    }
  }

  Future _postRegister() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      Response? response = await UserService().postRegister(
          _memberName, _nickname, _password, _email, _selectedDate);
      if (response != null) {
        if (!mounted) return;
        Navigator.pop(context);
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardSizeProvider(
      smallSize: 500,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 28, right: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const HelloRegiset(),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "아이디",
                          ),
                          style: const TextStyle(fontSize: 20),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '아이디를 입력해주세요.';
                            }
                            if (!RagExpPatteurn.userNamePasswordPattern
                                .hasMatch(value)) {
                              return '아이디는 영어와 숫자로 6글자 이상이어야 합니다.';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            _memberName = value!;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "닉네임",
                          ),
                          style: const TextStyle(fontSize: 20),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '비밀번호를 입력해주세요.';
                            }
                            if (value.length < 3) {
                              return '닉네임은 3글자 이상이어야 합니다.';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            _nickname = value!;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                              hintText: "이메일",
                            ),
                            style: const TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '아이디를 입력해주세요.';
                              }
                              if (!RagExpPatteurn.emailPattern
                                  .hasMatch(value)) {
                                return '입력하신 정보가 이메일의 형식과 다릅니다.';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              _email = value!;
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                              hintText: "비밀번호",
                            ),
                            obscureText: true,
                            style: const TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '비밀번호를 입력해주세요.';
                              }
                              if (!RagExpPatteurn.userNamePasswordPattern
                                  .hasMatch(value)) {
                                return '비밀번호는 영어와 숫자로 6글자 이상이어야 합니다.';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              _password = value!;
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                              hintText: "생년월일",
                            ),
                            onTap: () {
                              _selectDate(context);
                            },
                            controller: _dateController,
                            style: const TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '생년월일을 입력해주세요';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              _selectedDate = value!;
                            }),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 110,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _postRegister,
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 58, 106, 188)),
                          child: const Text(
                            "회원가입",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HelloRegiset extends StatelessWidget {
  const HelloRegiset({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.topLeft,
          child: IconButton(
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_back,
            ),
            style: IconButton.styleFrom(alignment: Alignment.topLeft),
          ),
        ),
        const Text(
          "어서오세요!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        const Text(
          "Towe에서 효율적인 일상 관리를 시작해봐요.",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
