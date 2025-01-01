import 'package:flutter/material.dart';
import 'package:productivioapp/core/widgets/generaltoolbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the Register Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}