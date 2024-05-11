import 'package:buttomnavigationbar/screens/clockScreen.dart';
import 'package:buttomnavigationbar/screens/DateScreen.dart';
import 'package:buttomnavigationbar/screens/weatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Colors.transparent,
        color: Colors.blue, // Set navigation bar color here

        items: const [
          Icon(Icons.access_time, size: 30,color: Colors.white,), // Clock
          Icon(Icons.calendar_month, size: 30,color: Colors.white,), // Date
          Icon(Icons.sunny_snowing, size: 30,color: Colors.white,), // Weather
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          clockScreen(),
          TableBasicsExample(),
          WeatherScreen(),
        ],
      ),
    );
  }
}





