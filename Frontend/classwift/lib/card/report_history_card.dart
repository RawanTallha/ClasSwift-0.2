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
    return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors
                    .grey[200], // Light background color like in the image
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                      Divider(
                          color: Colors
                              .black45), // Horizontal line under Report ID
                      SizedBox(height: 8),
                      Text('Date: ${reportDate}'),
                      Text('Building: ${reportBuilding}'),
                      Text('Floor: ${reportFloor}'),
                      Text('Room: ${reportRoomNo}'),
                      Text('Issue type: ${reportIssue}'),
                      Text('Problem description: ${reportDescribtion}'),
                    ],
                  ),
                )
                );
  }
}