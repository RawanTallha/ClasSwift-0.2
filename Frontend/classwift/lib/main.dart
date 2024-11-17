import 'package:classwift/pages/profile_page.dart';
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
      //home: ServicesPage(title: 'Available Classes',),
      //home: history_page(),
      //home: NavigationBarScreen(), // we start from here
      //home: LoginPage(),
      //home: DemoPage(),
      home: ProfilePage()
      //home: ReportPage()
    );
  }
}
