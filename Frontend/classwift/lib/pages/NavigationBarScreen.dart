import 'package:classwift/pages/emergency_page.dart';
import 'package:classwift/pages/home_page.dart';
import 'package:classwift/pages/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  @override

  List screens = [
    const HomePage(),
    const emergencyPage(),
    const ProfilePage()
  ];
  int currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 10, 129, 255),
        unselectedItemColor: Colors.blueGrey,
        currentIndex: currentIndex, //changes the icon color when clicked 
        onTap: (value){
        currentIndex = value;
        setState(() {});
      },
      //backgroundColor: Color.fromARGB(194, 186, 152, 232),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.emergency), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '')
        ]
      ),
    );

  }
}