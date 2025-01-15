import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:productivioapp/features/home/presentation/pages/home_page.dart';
import 'injection.dart' as di; // Import the service locator setup file
import 'package:productivioapp/features/auth/presentation/pages/login_page.dart';
import 'package:productivioapp/features/auth/presentation/pages/register_page.dart';
import 'package:productivioapp/core/constants/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDDcdL0EeaHSGex84egdY7HF6FqhygRMXM',
      appId: '1:83334641922:android:5c2d78353e03a15d9a2a1b',
      messagingSenderId: '83334641922',
      projectId: 'productivio-d4eb5',
      storageBucket: 'productivio-d4eb5.firebasestorage.app',
    ),
  );
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
      initialRoute: Routes.home,
      routes: {
        Routes.login: (context) => const LoginPage(),
        Routes.register: (context) => const RegisterPage(),
        Routes.home: (context) => const HomePage(),
      },
    );
  }
}