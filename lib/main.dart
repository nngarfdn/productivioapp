import 'package:flutter/material.dart';
import 'package:productivioapp/features/auth/presentation/pages/loginpage.dart';
import 'package:productivioapp/features/auth/presentation/pages/registerpage.dart';
import 'package:productivioapp/core/constants/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Module',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.login,
      routes: {
        Routes.login : (context) => LoginPage(),
        Routes.register: (context) => RegisterPage(),
      },
    );
  }
}