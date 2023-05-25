import 'package:flutter/material.dart';
import 'sign-up.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mobileController = TextEditingController();
  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a mobile number';
    }
    if (value.length != 10) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null;
  }

  void _sendOTP(BuildContext context) {
    String? mobileNumber = _mobileController.text;
    String? validationError = _validateMobile(mobileNumber);
    if (validationError == null) {
      Navigator.pushNamed(context, '/verifyOtp', arguments: mobileNumber);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Validation Error'),
            content: Text(validationError),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Manager'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _mobileController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                labelStyle: TextStyle(fontSize: 18.0),
              ),
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textCapitalization: TextCapitalization.none,
              maxLength: 10,
              validator: _validateMobile,
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _sendOTP(context);
                },
                child: Text('Send OTP'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                child: Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(
                    fontSize: 16.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
