import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final eventImagePath;
  final String eventOrganizer;
  final String eventDesc;

// constructor to change icon and service in every card
  EventCard({
    required this.eventImagePath,
    required this.eventOrganizer,
    required this.eventDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 230, 221),
              borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            // event image/ add
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  eventImagePath,
                  height: 200,
                ),
              ),
            ),

            SizedBox(height: 15),

            // event organization (bold)
            Text(
              eventOrganizer,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            // event description
            Text(eventDesc),
          ]),
        ),
      ),
    );
  }
}
