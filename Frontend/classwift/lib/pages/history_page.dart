// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:classwift/card/report_history_card.dart';
import 'package:flutter/material.dart';

class history_page extends StatelessWidget {
  const history_page(String s, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Reports History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          ReportHistoryCard(
            reportBuilding: 12,
            reportDate: '12/12/1222',
            reportDescribtion: 'idk',
            reportFloor: 1,
            reportID: '1020',
            reportIssue: 'many',
            reportRoomNo: 102
          ),
        ],),
      ),
    );
  }
}
