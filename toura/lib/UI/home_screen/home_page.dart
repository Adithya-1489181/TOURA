import 'package:flutter/material.dart';
import 'package:toura/UI/entire_trip_screen/entire_trip_page.dart';
import 'package:toura/UI/global.dart';
import 'package:toura/UI/home_screen/carousel_slider_suggetions.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

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
                  ListTile(
                    title: const Text("Upcoming trip demo"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EntireTripPage(
                                  "Upcoming tirp demo",
                                  CurrentPage.tripPlanPage)));
                    },
                  ),
                  ListTile(
                    title: const Text("Upcoming trip demo 2"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EntireTripPage(
                                  "Upcoming tirp demo 2",
                                  CurrentPage.tripPlanPage)));
                    },
                  )
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
                    title: const Text("Past trip demo"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EntireTripPage(
                                  "Past tirp demo",
                                  CurrentPage.melojourneyPage)));
                    },
                  ),
                  ListTile(
                    title: const Text("Past trip demo 2"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EntireTripPage(
                                  "Past tirp demo 2",
                                  CurrentPage.melojourneyPage)));
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
