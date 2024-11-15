import 'package:classwift/Demo.dart';
import 'package:classwift/pages/NavigationBarScreen.dart';
import 'package:classwift/pages/history_page.dart';
import 'package:classwift/pages/home_page.dart';
import 'package:classwift/pages/login_page.dart';
import 'package:classwift/pages/services_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      //home: ServicesPage(title: 'angry hams',),
      //home: history_page(),
      home: NavigationBarScreen(), // we start from here
      //home: LoginPage(),
      //home: DemoPage(),
    );
  }
}
