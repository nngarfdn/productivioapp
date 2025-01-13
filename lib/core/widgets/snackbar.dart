import 'package:flutter/material.dart';

class Snackbar {
  static void success(BuildContext context, String message) {
    _showSnackbar(
      context,
      message,
      backgroundColor: Colors.green, // Success color
    );
  }

  static void error(BuildContext context, String message) {
    _showSnackbar(
      context,
      message,
      backgroundColor: Colors.red, // Error color
    );
  }

  static void _showSnackbar(BuildContext context, String message,
      {required Color backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating, // Make it floating
        margin: const EdgeInsets.all(16), // Add some margin
        duration: const Duration(seconds: 3), // Duration for the snackbar
      ),
    );
  }
}