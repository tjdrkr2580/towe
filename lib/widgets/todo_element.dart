import 'package:flutter/material.dart';
import 'package:towe/screens/detail_screen.dart';
import 'package:towe/service/todo_service.dart';

class TodoElement extends StatefulWidget {
  TodoElement(this.content, this.checked, this.subTitle, this.title,
      this.priority, this.todoId,
      {super.key});
  String title;
  String subTitle;
  int priority;
  bool checked;
  int todoId;
  String content;

  @override
  State<TodoElement> createState() => _TodoElementState();
}

class _TodoElementState extends State<TodoElement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => DetailScreen(
                      todoId: widget.todoId,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 112, 164, 255),
            borderRadius: BorderRadius.circular(8)),
        height: 110,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22.5),
                child: Text(
                  widget.priority.toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 212, 218, 255),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Text(
            widget.subTitle,
            style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 233, 233, 233)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.scale(
                  scale: 1.25,
                  child: Checkbox(
                    value: widget.checked,
                    onChanged: (bool? value) => {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text("해당 투두를 변경하시겠습니까?"),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      bool dd = await TodoService()
                                          .patchTodo(widget.todoId, {
                                        'priority': widget.priority,
                                        'title': widget.title,
                                        'subTitle': widget.subTitle,
                                        'content': widget.content,
                                        'checked': !widget.checked
                                      });
                                      Navigator.of(context).pop();
                                      setState(() {
                                        widget.checked = value!;
                                      });
                                    },
                                    child: const Text("완료")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("취소")),
                              ],
                            );
                          }),
                    },
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
