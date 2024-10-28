
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage(String s, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Report an Issue'),
      ),
      body: Column(
        children: [
          Text('copy figma form'),
        ],
      ),
      
    );
  }
}