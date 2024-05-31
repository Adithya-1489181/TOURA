// import 'package:flutter/material.dart';

// class TripPlan extends StatelessWidget {
//   final String name;
//   const TripPlan(this.name, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return ElevatedButton(
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Pressed Day${index + 1}")));
//                   },
//                   child: Text("Day${index + 1}"),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TripPlanPage extends StatefulWidget {
  const TripPlanPage({super.key});

  @override
  State<TripPlanPage> createState() => _TripPlanPageState();
}

class _TripPlanPageState extends State<TripPlanPage> {
  List days = <ElevatedButton>[];
  int n = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Day1"),
              ),
              ...days,
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    days.add(ElevatedButton(
                        onPressed: () {}, child: Text("Day${n++}")));
                  });
                },
                child: const Text("Add +"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
