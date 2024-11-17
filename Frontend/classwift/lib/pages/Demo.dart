import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    const filePath = 'lib/assets/building11.json';
    final file = File(filePath);
    final jsonData = json.decode(await file.readAsString());
    final buildingClassrooms = jsonData['classrooms'] as List<dynamic>;

    classrooms
        .addAll(buildingClassrooms.map((item) => item as Map<String, dynamic>));
    floors.addAll(classrooms.map((room) => room['floor'].toString()).toSet());
  }

  void _updateClassNumbers(String floor) {
    classNumbers = classrooms
        .where((room) => room['floor'].toString() == floor)
        .map((room) => 'Class ${room['classroomNo']}')
        .toList();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final reportData = {
        "building": selectedBuilding,
        "floor": selectedFloor,
        "classroomNo": selectedClassNo,
        "issueType": selectedIssueType,
        "problemDesc": _descriptionController.text,
      };

      // Perform save operation (you can replace this with your actual saving logic)
      print('Form submitted successfully: $reportData');

      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Your report has been submitted successfully!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Show a snackbar or error dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report an Issue')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildDropdown(
                label: 'Building',
                value: selectedBuilding,
                onChanged: (value) {
                  setState(() => selectedBuilding = value);
                },
                items: ['Building 11'],
                validator: (value) =>
                    value == null ? 'Please select a building' : null,
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                label: 'Floor',
                value: selectedFloor,
                onChanged: (value) {
                  setState(() {
                    selectedFloor = value;
                    _updateClassNumbers(value!);
                    selectedClassNo = null;
                  });
                },
                items: floors,
                validator: (value) =>
                    value == null ? 'Please select a floor' : null,
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                label: 'Class Number',
                value: selectedClassNo,
                onChanged: (value) {
                  setState(() => selectedClassNo = value);
                },
                items: classNumbers,
                validator: (value) =>
                    value == null ? 'Please select a class number' : null,
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                label: 'Issue Type',
                value: selectedIssueType,
                onChanged: (value) {
                  setState(() => selectedIssueType = value);
                },
                items: ['Electrical', 'Plumbing', 'Furniture'],
                validator: (value) =>
                    value == null ? 'Please select an issue type' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Problem Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please describe the problem' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
      validator: validator,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
    );
  }
}
