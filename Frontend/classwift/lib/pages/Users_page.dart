import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Create a scaling animation
    _animation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF224B65),
                ),
              ),
              const SizedBox(height: 30.0), // Space between text and logo
              ScaleTransition(
                scale: _animation,
                child: Image.asset(
                  'lib/assets/logo.png', // Change this to your logo's path
                  width: 160, // Desired logo size
                ),
              ),
              const SizedBox(height: 40.0), // Space between logo and question
              const Text(
                "Who are you?",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xFF224B65),
                ),
              ),
              const SizedBox(height: 40.0), // Space before the circles
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircleButton(context, "Student", Icons.school),
                  _buildCircleButton(context, "Faculty", Icons.person),
                  _buildCircleButton(context, "Maintenance", Icons.build),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleButton(BuildContext context, String role, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Navigate to the existing LoginPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Column(
        children: [
          Container(
            width: 80, // Circle diameter
            height: 80, // Circle diameter
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF81B2DD),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8.0,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Colors.white,
              size: 40, // Adjust icon size
            ),
          ),
          const SizedBox(height: 8.0), // Space between circle and label
          Text(
            role,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
