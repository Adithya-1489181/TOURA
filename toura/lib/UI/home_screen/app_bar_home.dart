import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Toura'),
      centerTitle: true,
      // leading: IconButton(
      //   icon: const Icon(Icons.menu),
      //   onPressed: () => Scaffold.of(context).openDrawer(),
      // ),
    );
  }
}
