import 'package:flutter/material.dart';

class TripPlan extends StatelessWidget {
  final String name;
  const TripPlan(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed Day${index + 1}")));
                  },
                  child: Text("Day${index + 1}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
