import 'package:flutter/material.dart';

class ToweAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ToweAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

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
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_box_rounded),
              splashRadius: 18,
              iconSize: 25,
            ),
            IconButton(
              onPressed: () {},
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
