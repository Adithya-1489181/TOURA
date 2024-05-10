import 'package:flutter/material.dart';

import 'package:toura/UI/homepage.dart';

void main() {
  runApp(const Toura());
}

// TODO: Set up themes data and other things
class Toura extends StatelessWidget {
  const Toura({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toura",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const TouraHomePage(),
    );
  }
}
