import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<DemoPage> {
  String? selectedBuilding;
  String? selectedFloor;
  String? selectedClassNo;
  String? selectedIssueType;

  final TextEditingController _descriptionController = TextEditingController();
  final List<String> floors = [];
  List<String> classNumbers = [];
  final List<Map<String, dynamic>> classrooms = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final filePath = 'lib/assets/building11.json';
    final file = File(filePath);
    final jsonData = json.decode(await file.readAsString());
    final buildingClassrooms = jsonData['classrooms'] as List<dynamic>;

    classrooms
        .addAll(buildingClassrooms.map((item) => item as Map<String, dynamic>));
    floors.addAll(classrooms.map((room) => room['floor'].toString()).toSet());
  }

  String _generateReportId() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final randomChar1 =
        chars[(DateTime.now().millisecondsSinceEpoch ~/ 100) % chars.length];
    final randomChar2 =
        chars[(DateTime.now().millisecondsSinceEpoch ~/ 1000) % chars.length];
    final randomNum = (DateTime.now().millisecondsSinceEpoch % 100)
        .toString()
        .padLeft(2, '0');
    return '$randomChar1$randomChar2$randomNum';
  }

  void _updateClassNumbers(String floor) {
    // Filter classrooms based on selected floor
    classNumbers = classrooms
        .where((room) => room['floor'].toString() == floor)
        .map((room) => 'Class ${room['classroomNo']}')
        .toList();
  }

  Future<void> _saveReport() async {
    final reportId = _generateReportId();
    final reportData = {
      "reportId": reportId,
      "building": selectedBuilding,
      "floor": selectedFloor,
      "classroomNo": selectedClassNo,
      "date": DateTime.now().toIso8601String().split('T').first,
      "issueType": selectedIssueType,
      "problemDesc": _descriptionController.text,
      "status": "Under maintanacecece",
      "user_id": 1004
    };

    final filePath = 'lib/assets/reports.json';
    final file = File(filePath);
    List<dynamic> reports;

    if (await file.exists()) {
      final fileContents = await file.readAsString();
      final jsonData = json.decode(fileContents);
      reports = jsonData['reports'] ?? [];
    } else {
      reports = [];
    }

    reports.add(reportData);
    final updatedData = json.encode({"reports": reports});

    await file.writeAsString(updatedData, mode: FileMode.write);
    print('Report saved successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporting an Issue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Report form',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            SizedBox(height: 16),
            Divider(endIndent: 10, indent: 10),
            SizedBox(height: 40),

            // Building Dropdown
            _buildDropdown(
              label: 'Building',
              value: selectedBuilding,
              onChanged: (value) {
                setState(() {
                  selectedBuilding = value;
                });
              },
              items: ['Building 11'],
            ),
            SizedBox(height: 16),

            // Floor Dropdown
            _buildDropdown(
              label: 'Floor',
              value: selectedFloor,
              onChanged: (value) {
                setState(() {
                  selectedFloor = value;
                  _updateClassNumbers(
                      value!); // Update classrooms based on floor
                  selectedClassNo = null; // Reset selected class number
                });
              },
              items: floors,
            ),
            SizedBox(height: 16),

            // Class Number Dropdown
            _buildDropdown(
              label: 'Class no',
              value: selectedClassNo,
              onChanged: (value) {
                setState(() {
                  selectedClassNo = value;
                });
              },
              items: classNumbers,
            ),
            SizedBox(height: 16),

            // Issue Type Dropdown
            _buildDropdown(
              label: 'Issue type',
              value: selectedIssueType,
              onChanged: (value) {
                setState(() {
                  selectedIssueType = value;
                });
              },
              items: ['Electrical', 'Plumbing', 'Furniture'],
            ),
            SizedBox(height: 40),

            // Problem Description with attachment icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Problem description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.attachment),
              ],
            ),
            SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write a brief description of the problem',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveReport,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Color.fromARGB(255, 126, 194, 226),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Dropdown Builder
  Widget _buildDropdown({
    required String label,
    required String? value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 150,
          child: DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
