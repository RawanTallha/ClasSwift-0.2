import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: 0.8, // Adjust opacity for desired fade level
          duration: const Duration(milliseconds: 300), // Adjust duration for fade speed
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Keep the text color black
            ),
          ),
        ),
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove the shadow
        iconTheme: const IconThemeData(color: Colors.black), // Set the back button color to black
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            Text(
              'Building 11',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF81B2DD), // Set the text color to 81B2DD
              ),
            ),
            const SizedBox(height: 20),
            // Class List
            Expanded(
              child: ListView(
                children: [
                  // Example Class Entries
                  buildClassBar(
                      'Class 1',
                      '10:00 AM - 11:30 AM',
                      'Ground',
                      'Under Construction',
                      Color(0xFFD0F0C0)), // Light Apple Green
                  buildClassBar(
                      'Class 2',
                      '12:00 PM - 1:30 PM',
                      '1st',
                      'Available',
                      Color(0xFFBDC3C7)), // Light Gray
                  buildClassBar(
                      'Class 3',
                      '2:00 PM - 3:30 PM',
                      'Ground',
                      'Available',
                      Color(0xFFD0F0C0)), // Light Apple Green
                  buildClassBar(
                      'Class 4',
                      '4:00 PM - 5:30 PM',
                      '1st',
                      'Under Construction',
                      Color(0xFFBDC3C7)), // Light Gray
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClassBar(String classNumber, String duration, String floor, String status, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Class Number Bar
          Container(
            color: color,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              classNumber,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Details Container
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailRow('Duration:', duration),
                buildDetailRow('Floor:', floor),
                buildDetailRow('Status:', status),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}