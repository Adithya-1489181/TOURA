import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:toura/UI/appbar.dart';
import 'package:toura/UI/navigationbar.dart';

void main() {
  runApp(const Toura());
}

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
      home: const Scaffold(
        bottomNavigationBar: TouraNavigationBar(),
        appBar: TouraAppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [Text("r1, c1")],
                ),
                Column(
                  children: [Text("r1, c2")],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [Text("r2, c1")],
                ),
                Column(
                  children: [Text("r2, c2")],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
