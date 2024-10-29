import 'package:classwift/pages/NavigationBarScreen.dart';
import 'package:flutter/material.dart';
// Import your HomePage
import 'home_page.dart'; //path of homepage

// class Login_page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Page',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }

class LoginPage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo on the top right
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'lib/assets/logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              // Title at the top left
              Text(
                'ClasSwift',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF224B65),
                ),
              ),
              SizedBox(height: 50),
              // ID field
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'ID',
                  labelStyle: TextStyle(color: Color(0xFF81B2DD)),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Password field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color(0xFF81B2DD)),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Forgot Password text
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xFF81B2DD)),
                ),
              ),
              SizedBox(height: 20),
              // Login button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NavigationBarScreen(); // Ensure this matches the constructor of your HomePage
                  }));
                },
                child: Text('Login', style: TextStyle(fontSize: 18, color: Colors.white,),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF81B2DD),
                ),
              ),
              SizedBox(height: 30),
              // Other login options text
              Text(
                'Other Login Options',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF224B65),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Centered Row for pressable boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle first image tap
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://via.placeholder.com/60'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle second image tap
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://via.placeholder.com/60'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}