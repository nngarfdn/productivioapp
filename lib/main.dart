import 'package:flutter/material.dart';
import 'injection.dart' as di; // Import the service locator setup file
import 'package:productivioapp/features/auth/presentation/pages/login_page.dart';
import 'package:productivioapp/features/auth/presentation/pages/register_page.dart';
import 'package:productivioapp/core/constants/routes.dart';


void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('BuildingMyApp: called');
    return MaterialApp(
      title: 'Auth Module',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.login,
      routes: {
        Routes.login: (context) => const LoginPage(),
        Routes.register: (context) => const RegisterPage(),
      },
    );
  }
}