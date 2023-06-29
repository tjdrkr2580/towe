import 'package:flutter/material.dart';
import 'package:towe/screens/todo_edit.dart';

class ToweAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ToweAppBar({
    required this.isMenu,
    super.key,
  });

  final bool isMenu;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          'Towe.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          textAlign: TextAlign.left,
        ),
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: isMenu == false
          ? []
          : [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const TodoEditScreen()));
                    },
                    icon: const Icon(Icons.add_box_rounded),
                    splashRadius: 18,
                    iconSize: 25,
                  ),
                  IconButton(
                    onPressed: () => openDrawer(context),
                    icon: const Icon(Icons.menu),
                    splashRadius: 18,
                    iconSize: 25,
                  ),
                ],
              ),
            ],
    );
  }
}
