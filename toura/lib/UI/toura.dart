import 'package:flutter/material.dart';
import 'package:toura/UI/home_page_body.dart';

enum CurrentPage { homePage, mapPage, todoPage }

class Toura extends StatefulWidget {
  const Toura({super.key});

  @override
  State<Toura> createState() => _TouraState();
}

class _TouraState extends State<Toura> {
  CurrentPage _currentPage = CurrentPage.homePage;
  Widget _page = const Placeholder();

  @override
  Widget build(BuildContext context) {
    switch (_currentPage) {
      case CurrentPage.homePage:
        _page = const HomePageBody();
        break;
      case CurrentPage.mapPage:
        _page = const Placeholder();
        break;
      case CurrentPage.todoPage:
        _page = const Placeholder();
        break;
      default:
        _page = const Placeholder();
    }

    return MaterialApp(
      title: "Toura",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentPage.index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.map), label: "Map"),
            NavigationDestination(icon: Icon(Icons.list), label: "Todo"),
          ],
          onDestinationSelected: (value) {
            setState(() {
              _currentPage = CurrentPage.values.elementAt(value);
            });
          },
        ),
        body: _page,
      ),
    );
  }
}
