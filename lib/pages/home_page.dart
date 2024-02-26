import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:samer/pages/diet_page.dart';
import 'package:samer/pages/favorite_page.dart';
import 'package:samer/pages/food_page.dart';
import 'package:samer/pages/news_page.dart';
import 'package:samer/pages/person_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int seciliIndex = 0;

  List<Widget> pages = [
    NewsPage(),
    FoodPage(),
    DietPage(),
    FavoritePage(),
    PersonPage()
  ];

  void sayfaSec(int value) {
    setState(() {
      seciliIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.favorite,
              size: 35,
              color: Colors.red,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          "SAMER",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[400],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.green.shade400,
        color: Color.fromARGB(255, 44, 121, 47),
        animationDuration: Duration(milliseconds: 300),
        buttonBackgroundColor: Color.fromARGB(255, 44, 121, 47),
        onTap: (value) {
          sayfaSec(value);
        },
        items: [
          Icon(
            Icons.newspaper,
            color: Colors.white,
          ),
          Icon(
            Icons.local_dining,
            color: Colors.white,
          ),
          Icon(
            Icons.forum,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[seciliIndex],
    );
  }
}
