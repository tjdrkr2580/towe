import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:towe/models/todo_data.dart';
import 'package:towe/service/dio_singleton.dart';

class TodoService {
  Dio dio = Dio();
  Future<Response?> postTodo(priority, title, subtitle, content) async {
    Response response = await DioSingleton.dio
        .post("${dotenv.env['TOWE_DEFAULT_URL']!}todos", data: {
      "priority": int.parse(priority),
      "title": title,
      "subTitle": subtitle,
      "content": content,
      "checked": false,
    });
    if (response.statusCode != 200) {
      return null;
    }
    return response;
  }

  Future<List<Todo>> getTodo() async {
    Response? response =
        await DioSingleton.dio.get("${dotenv.env['TOWE_DEFAULT_URL']!}todos");
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch todos');
    }
    List<Todo> todos = [];
    for (var todoData in response.data) {
      Map<String, dynamic> data = Map<String, dynamic>.from(todoData);
      Todo todo = Todo(data['priority'], data['title'], data['subTitle'],
          data['content'], data['checked']);
      todos.add(todo);
    }
    return todos;
  }
}
