import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('no inspos or thoughts generally at 12:18am 10.29.24'),
          Image.asset('lib/assets/thinking-spidey.jpg'),
          Text('me thinking.. d\ne\ne\ne\ne\ne\ne\n-ply thinking\nI THINK')
        ],
      ),
      
    );
  }
}