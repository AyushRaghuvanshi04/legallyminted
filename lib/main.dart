import 'package:flutter/material.dart';
import 'home.dart'; // Ensure this import statement is correct
import 'login.dart'; // Import the LoginPage widget from login.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: _checkLoginStatus(), // Simulate an asynchronous login check
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading indicator while waiting
          } else if (snapshot.hasData && snapshot.data == true) {
            return Home(); // If logged in, show the Home page
          } else {
            return LoginPage(); // If not logged in, show the Login page
          }
        },
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    // Simulate a delay to mimic an asynchronous login check
    await Future.delayed(Duration(seconds:   2));
    // For simplicity, always return true to simulate a logged-in user
    return true;
  }
}
