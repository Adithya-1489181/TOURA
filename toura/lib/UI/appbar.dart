import 'package:flutter/material.dart';

class TouraAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TouraAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  void printThings() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: 100,
      leading: IconButton(
        icon: const Icon(
          Icons.circle,
          size: 50,
        ),
        onPressed: () => print("Leading widget"),
      ),
      // leadingWidth: 100,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.circle,
            size: 50,
          ),
          onPressed: () => print("Action widget circle1"),
        ),
      ],
      // title: const Text('Toura'),
    );
  }
}
