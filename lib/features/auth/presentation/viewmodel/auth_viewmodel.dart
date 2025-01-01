import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Show error (you can add more validation logic here)
      return;
    }

    try {
      setLoading(true);
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      // Handle success (navigate or store token)
      print('Login successful with email: $email');
    } catch (e) {
      // Handle error
      print('Login failed: $e');
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}