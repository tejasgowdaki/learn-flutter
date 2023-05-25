import 'package:flutter/material.dart';
import 'package:helloworld/login/landing.dart';
import 'package:helloworld/login/login.dart';
import 'package:helloworld/login/verify_otp.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.lightBlue[50],
      ),
      initialRoute: '/login', // Update the initial route to '/login'
      routes: {
        '/': (context) => LandingPage(), // Change the route to '/login'
        '/login': (context) => LoginPage(), // Change the route to '/login'
        '/verifyOtp': (context) => VerifyOtpPage(),
      },
    );
  }
}
