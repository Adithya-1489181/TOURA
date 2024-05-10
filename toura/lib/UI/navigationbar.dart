import 'package:flutter/material.dart';

// TODO: Implementation of onPressed functions and other things
class TouraNavigationBar extends StatelessWidget {
  const TouraNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => print("Home"),
        ),
        IconButton(
          icon: const Icon(Icons.note),
          onPressed: () => print("note"),
        ),
        IconButton(
          icon: const Icon(Icons.folder),
          onPressed: () => print("folder"),
        ),
        IconButton(
          icon: const Icon(Icons.camera_alt_rounded),
          onPressed: () => print("camera"),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => print("add"),
        ),
      ],
    );
  }
}
