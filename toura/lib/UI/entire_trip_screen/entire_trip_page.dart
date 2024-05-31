import 'package:flutter/material.dart';
import 'package:toura/UI/chat_screen/chat_page.dart';
import 'package:toura/UI/global.dart';
import 'package:toura/UI/melojourney_screen/melojourney_page.dart';
import 'package:toura/UI/trip_plan_screen/trip_plan_page.dart';

class EntireTripPage extends StatefulWidget {
  final String title;
  final CurrentPage currentPage;

  const EntireTripPage(this.title, this.currentPage, {super.key});

  @override
  State<EntireTripPage> createState() => _EntireTripPageState();
}

class _EntireTripPageState extends State<EntireTripPage> {
  CurrentPage _currentPage = CurrentPage.chatPage;
  @override
  void initState() {
    _currentPage = widget.currentPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final page = <Widget>[
      const TripPlanPage(),
      const ChatPage(),
      const MelojourneyPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: page[_currentPage.index],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _currentPage.index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.list),
              label: "Trip Plan",
            ),
            NavigationDestination(
              icon: Icon(Icons.chat),
              label: "Chat Bot",
            ),
            NavigationDestination(
              icon: Icon(Icons.map),
              label: "Melojourney",
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              _currentPage = CurrentPage.values.elementAt(index);
            });
          }),
    );
  }
}
