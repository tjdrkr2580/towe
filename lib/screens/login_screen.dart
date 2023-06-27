import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:towe/provider/towe_provider.dart';
import 'package:provider/provider.dart';
import 'package:towe/screens/home_screen.dart';
import 'package:towe/screens/register_screen.dart';
import 'package:towe/service/ragexp_patteurn.dart';
import 'package:towe/service/user_service.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _memberName;
  String? _password;

  Future _postLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      Response? response =
          await UserService().postLogin(_memberName, _password);
      if (response != null) {
        final token = response.headers.map['authorization']!.first;
        if (!mounted) return;
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        authProvider.setAuthData(token, _memberName!);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        return response;
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 50, left: 28, right: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HelloLogin(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "아이디",
                      ),
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
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
                      onSaved: (value) {
                        _memberName = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "비밀번호",
                      ),
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
                      obscureText: true,
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
                      onSaved: (value) {
                        _password = value;
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _postLogin,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 74, 137, 248)),
                      child: const Text(
                        "로그인",
                        style: TextStyle(
                            fontSize: 18.5, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterScreen()),
                        );
                      },
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
    );
  }
}

class HelloLogin extends StatelessWidget {
  const HelloLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "어서오세요!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 5),
        Text(
          "우리 처음 본 사이가 아닌가봐요.",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
