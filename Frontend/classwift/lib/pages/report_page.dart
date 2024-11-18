import 'dart:convert';
import 'dart:io';
import 'package:classwift/pages/NavigationBarScreen.dart';
import 'package:classwift/pages/home_page.dart';
import 'package:flutter/material.dart';
// Removed unused import 'package:intl/intl_browser.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportPage> {
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
    try {
      const filePath = 'assets/building11.json'; // Correct path
      final file = File(filePath);
      final jsonData = json.decode(await file.readAsString());
      final buildingClassrooms = jsonData['classrooms'] as List<dynamic>;

      classrooms.addAll(
          buildingClassrooms.map((item) => item as Map<String, dynamic>));
      floors.addAll(classrooms.map((room) => room['floor'].toString()).toSet());
    } catch (e) {
      print("Error loading data: $e");
    }
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
    setState(() {
      classNumbers = classrooms
          .where((room) => room['floor'].toString() == floor)
          .map((room) => 'Class ${room['classroomNo']}')
          .toList();
    });
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
      "status": "Under maintenance", // Correct status
      "user_id": 1004
    };

    const filePath = 'assets/reports.json'; // Correct path
    final file = File(filePath);
    List<dynamic> reports;

    bool isSubmissionSuccessful = false;

    try {
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

      isSubmissionSuccessful = true;
    } catch (e) {
      isSubmissionSuccessful = false;
    }

    _showFeedbackDialog(isSubmissionSuccessful);
  }

  void _showFeedbackDialog(bool isSuccess) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FeedbackPopup(
          message: isSuccess
              ? 'Your report has been submitted successfully!'
              : 'There was an error submitting your report. Please try again.',
          isSuccess: isSuccess,
          onClose: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporting an Issue'),
      ),
      body: Stack(
        children: [
          // Wallpaper background
          Positioned.fill(
            child: Image.asset(
              'lib/assets/wallpapers (2).png',
              fit: BoxFit.cover, // Cover the entire background
            ),
          ),
          // Form content with padding
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Report form',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(
                  endIndent: 10,
                  indent: 10,
                ),
                const SizedBox(height: 40),

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
                const SizedBox(height: 16),

                // Floor Dropdown
                _buildDropdown(
                  label: 'Floor',
                  value: selectedFloor,
                  onChanged: (value) {
                    setState(() {
                      selectedFloor = value;
                      _updateClassNumbers(value!);
                      selectedClassNo = null; // Reset class number
                    });
                  },
                  items: floors,
                ),
                const SizedBox(height: 16),

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
                const SizedBox(height: 16),

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
                const SizedBox(height: 40),

                // Problem Description with attachment icon
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Problem description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.attachment),
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Write a brief description of the problem',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _saveReport,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color.fromARGB(255, 126, 194, 226),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 150,
          child: DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            decoration: const InputDecoration(
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

class FeedbackPopup extends StatelessWidget {
  final String message;
  final bool isSuccess;
  final VoidCallback onClose;

  const FeedbackPopup({
    required this.message,
    required this.isSuccess,
    required this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: isSuccess
                  ? const Color.fromARGB(255, 92, 138, 110)
                  : Colors.red,
              size: 50,
            ),
            const SizedBox(height: 16),
            Text(
              isSuccess ? 'Smooth Operation' : 'Not Smooth Operation',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
                if (isSuccess) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const NavigationBarScreen()),
                    (route) => false, // Clear the navigation stack
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                isSuccess ? 'Continue' : 'Try again',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
