// login.dart
import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Login Page'),
            ElevatedButton(
              onPressed: () {
                // Simulate login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
