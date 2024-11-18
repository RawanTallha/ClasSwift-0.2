import 'package:classwift/pages/Demo.dart';
import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models/building.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReportPage(),
    );
  }
}

// class BuildingPage extends StatefulWidget {
//   @override
//   _BuildingPageState createState() => _BuildingPageState();
// }

// class _BuildingPageState extends State<BuildingPage> {
//   late Future<Building> building;

//   @override
//   void initState() {
//     super.initState();
//     building = ApiService().fetchBuildingData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Building Info')),
//       body: FutureBuilder<Building>(
//         future: building,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             var buildingData = snapshot.data!;
//             return ListView.builder(
//               itemCount: buildingData.classrooms.length,
//               itemBuilder: (context, index) {
//                 var classroom = buildingData.classrooms[index];
//                 return ListTile(
//                   title: Text('Classroom ${classroom.classroomNo}'),
//                   subtitle: Text(
//                       'Floor: ${classroom.floor}, Capacity: ${classroom.capacity}'),
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
// }
