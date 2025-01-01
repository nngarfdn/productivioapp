import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Center(
        child: Text(
          'This is the Register Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}