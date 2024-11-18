// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:classwift/card/event_card.dart';
import 'package:classwift/card/report_history_card.dart';
import 'package:classwift/card/services_card.dart';
import 'package:classwift/pages/contact_page.dart';
import 'package:classwift/pages/history_page.dart';
import 'package:classwift/pages/login_page.dart';
import 'package:classwift/pages/profile_page.dart';
import 'package:classwift/pages/report_page.dart';
import 'package:classwift/pages/Availability_Page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        //backgroundColor: Colors.white60,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 30),
            Container(
              alignment: Alignment.centerLeft, // Align to the left
              padding:
                  EdgeInsets.all(16.0), // Optional: Add padding for spacing
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Align children to the left
                children: [
                  Icon(Icons.menu_rounded,
                      color: Color.fromARGB(255, 121, 89, 178)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 121, 89, 178),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.settings,
                  color: Color.fromARGB(255, 121, 89, 178)),
              title: Text('Settings'),
              onTap: () {
                // Action for Settings
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline_rounded,
                  color: Color.fromARGB(255, 121, 89, 178)),
              title: Text('About us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.support_agent,
                  color: Color.fromARGB(255, 121, 89, 178)),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ContactUsPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,
                  color: Color.fromARGB(255, 121, 89, 178)),
              title: Text('Exit'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/wallpaper.png', // Replace with your image path
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15),

                  // App bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: Icon(Icons.menu,
                                color: Color.fromARGB(255, 56, 120, 176)),
                            onPressed: () {
                              Scaffold.of(context)
                                  .openDrawer(); // Opens the sidebar
                            },
                          ),
                        ),
                        // Logo
                        Image.asset(
                          'lib/assets/logo.png',
                          height: 45,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'Peter B. Parker',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Card --> Catchphrase
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 210, 224, 251),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // The Phrase
                            Column(
                              children: [
                                Text(
                                  'From classes to repairs, \nClasSwift cares',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            // Picture
                            Image.asset(
                              'lib/assets/college class-amico.png',
                              height: 120,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // Services List Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Services list',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  // Horizontal ListView --> Services
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    child: SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // ServicesCard(
                          //   serviceName: 'View availability',
                          //   iconImagePath: 'lib/assets/users-class.png',
                          //   pageTitle: 'View Availability',
                          //   buttonText: 'View now!',
                          //   pageName: ServicesPage(title: 'View Availability'),
                          // ),
                          ServicesCard(
                            serviceName: 'Report an issue',
                            iconImagePath: 'lib/assets/file-edit.png',
                            pageTitle: 'Reports',
                            buttonText: 'file a report',
                            pageName: ReportPage(),
                          ),
                          ServicesCard(
                            serviceName: 'History',
                            iconImagePath: 'lib/assets/time-past.png',
                            pageTitle: 'History',
                            buttonText: 'review history',
                            pageName: history_page('Reports History'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // Events List Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Events',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  // Horizontal ListView for Events
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: 250, // Set height for horizontal ListView
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          EventCard(
                              eventImagePath: 'lib/assets/some-event.png',
                              eventOrganizer: 'GDGUJ',
                              eventDesc:
                                  'some workshop by the google developer group(s?)'),
                          EventCard(
                              eventImagePath: 'lib/assets/game-event.png',
                              eventOrganizer: 'GDGUJ',
                              eventDesc:
                                  'some workshop by the google developer group(s?)'),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // Recents List Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent reports',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const history_page(
                                  ''); // MAKE A POP UP PAGE PLEASE
                            }));
                          },
                          child: Text(
                            'see all',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Horizontal ListView for Recents
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 250, // Set height for horizontal ListView
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ReportHistoryCard(
                            reportBuilding: 12,
                            reportDate: '12/12/1222',
                            reportDescribtion: 'idk',
                            reportFloor: 1,
                            reportID: '1020',
                            reportIssue: 'many',
                            reportRoomNo: 102,
                          ),
                          ReportHistoryCard(
                            reportBuilding: 12,
                            reportDate: '12/12/1222',
                            reportDescribtion: 'idk',
                            reportFloor: 1,
                            reportID: '1020',
                            reportIssue: 'many',
                            reportRoomNo: 102,
                          ),
                          ReportHistoryCard(
                            reportBuilding: 12,
                            reportDate: '12/12/1222',
                            reportDescribtion: 'idk',
                            reportFloor: 1,
                            reportID: '1020',
                            reportIssue: 'many',
                            reportRoomNo: 102,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
