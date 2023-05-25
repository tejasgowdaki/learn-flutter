import 'package:flutter/material.dart';
import 'package:helloworld/login/landing.dart';
import 'login/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Manager',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.lightBlue[50],
      ),
      initialRoute: '/', // Update the initial route to '/login'
      routes: {
        '/': (context) => LandingPage(), // Change the route to '/login'
      },
    );
  }
}
