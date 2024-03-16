import 'package:flutter/material.dart';
import 'package:online_class_app/screen/BottomNavigation/Classes/classes_screen.dart';
import 'package:online_class_app/screen/BottomNavigation/Home/home_screen.dart';
// import 'package:online_class_app/screen/BottomNavigation/Home/home_screen.dart';
import 'package:online_class_app/screen/BottomNavigation/Notification/notification_screen.dart';
import 'package:online_class_app/screen/BottomNavigation/Settings/settings_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _screens = [
    HomeScreen(),
    NotificationScreen(),
    ClassesScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Color(0xFFA2A2A2),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "Assets/Bottom_navigation_logos/home.png",
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "Assets/Bottom_navigation_logos/28.png",
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: 'Notificaton',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "Assets/Bottom_navigation_logos/book.png",
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "Assets/Bottom_navigation_logos/profile.png",
              color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
