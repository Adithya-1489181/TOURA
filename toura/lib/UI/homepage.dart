import 'package:flutter/material.dart';

import 'package:toura/UI/appbar.dart';
import 'package:toura/UI/navigationbar.dart';

class TouraHomePage extends StatefulWidget {
  const TouraHomePage({super.key});

  @override
  State<TouraHomePage> createState() => _TouraHomePageState();
}

// TODO: Organizing and implementation of things in body
class _TouraHomePageState extends State<TouraHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TouraNavigationBar(),
      appBar: const TouraAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Column(
          children: [
            // Slide show widget
            Flexible(
              flex: 100,
              child: Container(
                color: Colors.amber,
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            // Help Promts row 1
            Flexible(
              flex: 100,
              child: Row(
                children: [
                  Flexible(
                    flex: 100,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  Flexible(
                    flex: 100,
                    child: Container(
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            // Help prompts row 2
            Flexible(
              flex: 100,
              child: Row(
                children: [
                  Flexible(
                    flex: 100,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  Flexible(
                    flex: 100,
                    child: Container(
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
            // Chat box
            const Flexible(
              flex: 30,
              child: TextField(),
            ),
          ],
        ),
      ),
    );
  }
}
