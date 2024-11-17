import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/wallpaper.png'), // Set your wallpaper image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Logo at the top right
          Positioned(
            top: 20,
            right: 20,
            child: Image.asset(
              'lib/assets/logo.png', // Set your logo image here
              width: 100, // Set desired width
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the Column
                crossAxisAlignment: CrossAxisAlignment.center, // Center contents horizontally
                children: [
                  // Profile Picture Section
                  _buildProfilePicture(),

                  const SizedBox(height: 20.0), // Space between picture and name
                  const Text(
                    'User Name',
                    textAlign: TextAlign.center, // Center the text
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 83, 133, 193),
                    ),
                  ),

                  const SizedBox(height: 16.0), // Space between name and additional info
                  const Text(
                    'user.email@example.com',
                    textAlign: TextAlign.center, // Center the text
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(179, 45, 98, 189),
                    ),
                  ),

                  const SizedBox(height: 40.0), // Space between sections

                  // ID Card Section
                  _buildIdCard(),

                  const SizedBox(height: 40.0), // Space between sections

                  // Profile Settings Section
                  _buildProfileSettings(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10.0), // Space before the avatar
          // Border around profile picture
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 4.0,
                color: const Color.fromARGB(255, 182, 208, 254),
              ),
            ),
            child: const CircleAvatar(
              radius: 62.0,
              backgroundColor: Color(0xFF81B2DD),
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('lib/assets/pfp1.jpg'), // Use the correct asset path
                backgroundColor: Colors.grey, // Fallback color if image fails to load
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdCard() {
    return Card(
      elevation: 15.0,
      shadowColor: Colors.black54,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'ID Card',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF224B65),
              ),
            ),
            const SizedBox(height: 8.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'lib/assets/IDpic.jpg', // Ensure the path is correct
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSettings(BuildContext context) {
    return Card(
      elevation: 15.0,
      shadowColor: Colors.black54,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Settings',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF224B65),
              ),
            ),
            const SizedBox(height: 16.0),
            _buildListTile(context, Icons.person, 'Edit Profile', EditProfilePage()),
            _buildListTile(context, Icons.lock, 'Change Password', ChangePasswordPage()),
            _buildListTile(context, Icons.notifications, 'Notifications', NotificationSettingsPage()),
            _buildListTile(context, Icons.report, 'Past Report Status', PastReportStatusPage()),
            _buildListTile(context, Icons.contact_mail, 'Contact Us', ContactUsPage()),
            _buildListTile(context, Icons.report_problem, 'Report Issue', ReportIssuePage()),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF224B65)),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF224B65),
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

// Each of these screens are placeholders. Implement their logic as needed.
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color(0xFF81B2DD),
      ),
      body: const Center(
        child: Text('Edit Profile Screen - Implement editing logic here'),
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: const Color(0xFF81B2DD),
      ),
      body: const Center(
        child: Text('Change Password Screen - Implement password change logic here'),
      ),
    );
  }
}

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: const Color(0xFF81B2DD),
      ),
      body: const Center(
        child: Text('Notification Settings Screen - Implement notification settings here'),
      ),
    );
  }
}

class PastReportStatusPage extends StatelessWidget {
  const PastReportStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Report Status'),
        backgroundColor: const Color(0xFF81B2DD),
      ),
      body: const Center(
        child: Text('Past Report Status Screen - Implement past report logic here'),
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: const Color(0xFF81B2DD),
      ),
      body: const Center(
        child: Text('Contact Us Screen - Implement contact us logic here'),
      ),
    );
  }
}

class ReportIssuePage extends StatelessWidget {
  const ReportIssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Issue'),
        backgroundColor: const Color(0xFF81B2DD),
      ),
      body: const Center(
        child: Text('Report Issue Screen - Implement report issue logic here'),
      ),
    );
  }
}