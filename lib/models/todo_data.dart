class Todo {
  int priority;
  String title;
  String subTitle;
  String content;
  bool checked;
  int todoId;

  Todo(this.priority, this.title, this.subTitle, this.content, this.checked,
      this.todoId);

  Todo.fromMap(Map<String, dynamic> todo)
      : title = todo['title'],
        checked = todo['checked'],
        subTitle = todo['subTitle'],
        content = todo['content'],
        priority = todo['priority'],
        todoId = todo['todoId'];
}
