import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/building.dart';

class ServicesPage extends StatefulWidget {
  final String title;

  ServicesPage({Key? key, required this.title}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late Future<Building> futureBuilding;

  Future<Building> loadBuildingData() async {
    final String response = await rootBundle.loadString('lib/assets/building11.json');
    final data = await json.decode(response);
    return Building.fromJson(data);
  }

  @override
  void initState() {
    super.initState();
    futureBuilding = loadBuildingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/wallpaper.png'), // Set your background image here
            fit: BoxFit.cover, // This will cover the whole screen
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Building>(
          future: futureBuilding,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              Building building = snapshot.data!;
              
              // Filter only available classrooms
              final availableClassrooms = building.classrooms.where((classroom) => classroom.isAvailable).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Centered Title: Hardcoded "Building 11"
                  Center(
                    child: Text(
                      'Building 11', // Hardcoded text
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Adjust for visibility
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Available Classrooms Title
                  Text(
                    'Available Classrooms',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800], // Grey color for the title
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Class List
                  Expanded(
                    child: ListView.builder(
                      itemCount: availableClassrooms.length,
                      itemBuilder: (context, index) {
                        Classroom classroom = availableClassrooms[index];
                        return buildClassBar(
                          classroom.classroomNo.toString(),
                          classroom.floor.toString(),
                          classroom.capacity.toString(),
                          classroom.isALab, // Pass lab status for coloring
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildClassBar(String classNumber, String floor, String capacity, bool isALab) {
    Color color = isALab ? Color.fromARGB(255, 126, 181, 248) // Light red for labs
                          : Color(0xFFD0F0C0); // Light green for regular classrooms

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
              'Classroom No: $classNumber',
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
                buildDetailRow('Floor:', floor),
                buildDetailRow('Capacity:', capacity),
                buildDetailRow('Type:', isALab ? 'Lab' : 'Classroom'), // Display classroom type
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