import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:towe/models/todo_data.dart';
import 'package:towe/provider/towe_provider.dart';
import 'package:towe/screens/landing_screen.dart';
import 'package:towe/service/todo_service.dart';
import 'package:towe/widgets/today.dart';
import 'package:towe/widgets/todo_element.dart';
import 'package:towe/widgets/towe_appbar.dart';
import 'package:towe/widgets/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider provider = Provider.of<AuthProvider>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: const ToweAppBar(
          isMenu: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue.shade300, Colors.blue.shade500],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: const WeatherWidget(),
              ),
              const TodayWidget(),
              Expanded(
                child: FutureBuilder(
                  future: TodoService().getTodo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Todo> todos = snapshot.data!;
                      return ListView.separated(
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            Todo todo = todos[index];
                            return TodoElement(
                                todo.content,
                                todo.checked,
                                todo.subTitle,
                                todo.title,
                                todo.priority,
                                todo.todoId);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 15,
                            );
                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                // child: ListView.separated(
                //   itemCount: 6,
                //   itemBuilder: (context, index) {
                //     return const TodoElement();
                //   },
                //   separatorBuilder: (context, index) {
                //     return const SizedBox(
                //       height: 15,
                //     );
                //   },
                // ),
              )
            ],
          ),
        ),
        endDrawer: SizedBox(
          width: 225,
          child: Drawer(
            child: Column(
              children: [
                DrawerHeader(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.username!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          provider.reset();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => const LandingScreen()));
                        },
                        icon: const Icon(Icons.logout))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
