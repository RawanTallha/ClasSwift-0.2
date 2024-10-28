import 'package:flutter/material.dart';

class services_page extends StatelessWidget {
  const services_page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text(
              'Hello my dear,\nwe are under construction.\ncomeback later <3 <3'),
        ),
      ),
    );
  }
}
