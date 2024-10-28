// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:classwift/card/event_card.dart';
import 'package:classwift/card/services_card.dart';
import 'package:classwift/pages/history_page.dart';
import 'package:classwift/pages/report_page.dart';
import 'package:classwift/pages/services_page.dart';
// import 'package:classwift/pages/services_page.dart';
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
      backgroundColor: Color.fromARGB(255, 237, 243, 250),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //   BottomNavigationBarItem(icon: Icon(Icons.emergency), label: ''),
      //   BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
      // ]),
      body: SafeArea(
        child: SingleChildScrollView(
          // Make the whole body scrollable
          child: Column(children: [
            SizedBox(height: 15),
            // app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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

                  // profile pic
                  // Container(
                  //     padding: EdgeInsets.all(12),
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey[100],
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: Icon(
                  //       Icons.person,
                  //       color: Colors.grey[400],
                  //     )
                  //     ),
                  Image.asset(
                    'lib/assets/logo.png',
                    height: 45,
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            // card --> catch phrase
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 210, 224, 251),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // THE phrase
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

                        // picture
                        Image.asset(
                          'lib/assets/college class-amico.png',
                          height: 120,
                        ),
                      ]),
                ),
              ),
            ),

            SizedBox(height: 25),

            // see all button/ line
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

            // horizontal listview --> services
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ServicesCard(
                    serviceName: 'View availability',
                    iconImagePath: 'lib/assets/users-class.png',
                    pageTitle: 'View Availability',
                    buttonText: 'View now!',
                    pageName: services_page(title: 'View Availability'),
                  ),
                  ServicesCard(
                    serviceName: 'Report an issue',
                    iconImagePath: 'lib/assets/file-edit.png',
                    pageTitle: 'Reports',
                    buttonText: 'file a report',
                    pageName: ReportPage('Report an Issue'),
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

            SizedBox(height: 25),

            // see all button/ line
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

            // Horizontal ListView for events
            Container(
              height: 200, // Set height for horizontal ListView
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
                  // Add more EventCard widgets as needed
                ],
              ),
            ),

            SizedBox(height: 25),

            // Another section for events, if needed
            Container(
              height: 200, // Set height for horizontal ListView
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
          ]),
        ),
      ),
    );
  }
}
