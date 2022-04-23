import 'package:covid/screens/home.dart';
import 'package:covid/screens/stats.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    StatsScreen(),
    Scaffold(),
    Scaffold()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: _buildNavItems(),
      ),
    );
  }

  dynamic _buildNavItems() {
    return [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
        .asMap()
        .map((key, value) => MapEntry(
            key,
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  decoration: BoxDecoration(
                      color: _currentIndex == key
                          ? Colors.blue[300]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Icon(value),
                ))))
        .values
        .toList();
  }
}
