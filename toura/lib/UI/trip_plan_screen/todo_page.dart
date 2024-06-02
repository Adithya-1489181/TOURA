import 'package:flutter/material.dart';
import 'package:toura/UI/trip_plan_screen/trip_plan_page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: ListTile(
              title: Center(child: Text("Toura tour name ${index + 1}")),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TripPlanPage(/*"Toura tour name ${index + 1}"*/),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
