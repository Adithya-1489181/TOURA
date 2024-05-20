import 'package:flutter/material.dart';
import 'package:toura/src/UI/home_page.dart';

class Toura extends StatelessWidget {
  const Toura({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toura",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const TouraHomePage(),
    );
  }
}
