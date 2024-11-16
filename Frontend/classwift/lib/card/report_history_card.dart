// ignore: unused_import
import 'package:classwift/pages/history_page.dart';
import 'package:flutter/material.dart';

class ReportHistoryCard extends StatelessWidget {
  final String reportID;
  final String reportDate;

  // for now these are strings till i learn how to print out int lol
  final reportBuilding;
  final reportFloor;
  final reportRoomNo;
  final String reportIssue;
  final String reportDescribtion;
  final reportImgPath;

// constructor to change icon and service in every card
  ReportHistoryCard({
    required this.reportID,
    required this.reportDate,
    required this.reportBuilding,
    required this.reportFloor,
    required this.reportRoomNo,
    required this.reportIssue,
    required this.reportDescribtion,
    this.reportImgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Card(
        elevation: 2,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color.fromARGB(
            255, 255, 233, 167), // Light background color like in the image
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Text(
                  'Report ID: ${reportID}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ), // Horizontal line under Report ID
              Text('Date: ${reportDate}'),
              Text('Building: ${reportBuilding}'),
              Text('Floor: ${reportFloor}'),
              Text('Room: ${reportRoomNo}'),
              Text('Issue type: ${reportIssue}'),
              Text('Problem description: ${reportDescribtion}'),

              // button to either show more/ update status
              // Padding(
              //   padding: const EdgeInsets.only(top: 8),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return const history_page(
              //             ''); // MAKE A POP UP PAGE PLEASE
              //       }));
              //     },
              //     child: Text(
              //       'Show details',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Color.fromARGB(255, 241, 170, 82),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
