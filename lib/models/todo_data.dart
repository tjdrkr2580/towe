class Todo {
  int priority;
  String title;
  String subTitle;
  String content;
  bool checked;

  Todo(this.priority, this.title, this.subTitle, this.content, this.checked);

  Todo.fromMap(Map<String, dynamic> todo)
      : title = todo['title'],
        checked = todo['checked'],
        subTitle = todo['subTitle'],
        content = todo['content'],
        priority = todo['priority'];
}
