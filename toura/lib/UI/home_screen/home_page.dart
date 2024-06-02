import 'package:flutter/material.dart';
import 'package:toura/UI/entire_trip_screen/entire_trip_page.dart';
import 'package:toura/UI/global.dart';
import 'package:toura/UI/home_screen/carousel_slider_suggetions.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tiles = [];

  @override
  void initState() {
    tiles = <ListTile>[
      ListTile(
        title: const Text("Trip 1"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EntireTripPage(
                      "Trip 1", CurrentPage.tripPlanPage)));
        },
      ),
      ListTile(
        title: const Text("Trip 2"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const EntireTripPage("Trip 2", CurrentPage.tripPlanPage)),
          );
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 20,
            //         vertical: 10,
            //       ),
            //       icon: const Icon(
            //         Icons.circle,
            //         size: 60,
            //       ),
            //       onPressed: () {},
            //     ),
            //     IconButton(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 20,
            //         vertical: 10,
            //       ),
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.circle,
            //         size: 60,
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const CarouselSliderSuggetions(),
            ),

            const Text(
              "Upcoming Tours",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                children: [
                  // ListTile(
                  //   title: const Text("Trip 1"),
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const EntireTripPage(
                  //                 "Trip 1", CurrentPage.tripPlanPage)));
                  //   },
                  // ),
                  // ListTile(
                  //   title: const Text("Trip 2"),
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const EntireTripPage(
                  //               "Trip 2", CurrentPage.tripPlanPage)),
                  //     );
                  //   },
                  // ),
                  ...tiles,
                  ListTile(
                    title: Center(
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            tiles.add(
                              ListTile(
                                title: const Text("New trip"),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EntireTripPage("New trip",
                                                CurrentPage.tripPlanPage)),
                                  );
                                },
                              ),
                            );
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EntireTripPage(
                                    "New Trip", CurrentPage.tripPlanPage)),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Past Tours",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                children: [
                  ListTile(
                    title: const Text("Past trip 1"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EntireTripPage(
                                  "Past trip 1", CurrentPage.melojourneyPage)));
                    },
                  ),
                  ListTile(
                    title: const Text("Past trip 2"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EntireTripPage(
                                  "Past trip 2", CurrentPage.melojourneyPage)));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
