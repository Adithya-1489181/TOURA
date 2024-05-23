import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Text("Toura tour name $index"),
              ),
            ),
          );
        },
      ),
    );
  }
}
