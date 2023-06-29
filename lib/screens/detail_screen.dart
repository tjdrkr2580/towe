import 'package:flutter/material.dart';
import 'package:towe/models/todo_data.dart';
import 'package:towe/screens/home_screen.dart';
import 'package:towe/screens/patch_screen.dart';
import 'package:towe/service/todo_service.dart';
import 'package:towe/widgets/towe_appbar.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.todoId, super.key});
  final int todoId;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<Todo> todo;

  @override
  void initState() {
    super.initState();
    todo = TodoService().getDo(widget.todoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToweAppBar(
        isMenu: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: FutureBuilder(
            future: todo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      snapshot.data!.subTitle,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      snapshot.data!.content,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PatchScreen(
                                          title: snapshot.data!.title,
                                          todoId: snapshot.data!.todoId,
                                          content: snapshot.data!.content,
                                          priority: snapshot.data!.priority,
                                          subTitle: snapshot.data!.subTitle,
                                          checked: snapshot.data!.checked)));
                            },
                            child: const Text("수정")),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: const Text("정말 삭제하시겠습니까?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () async {
                                              bool removeBool =
                                                  await TodoService()
                                                      .deleteTodo(
                                                          widget.todoId);
                                              if (removeBool == true) {
                                                if (!mounted) return;
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                const HomeScreen()));
                                              } else {
                                                if (!mounted) return;
                                                Navigator.of(context).pop();
                                                const SnackBar(
                                                    content:
                                                        Text("오류가 발생했습니다"));
                                              }
                                            },
                                            child: const Text("삭제")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("취소"))
                                      ],
                                    );
                                  });
                            },
                            child: const Text("삭제")),
                      ],
                    )
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
