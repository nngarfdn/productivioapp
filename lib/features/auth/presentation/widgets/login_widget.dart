import 'package:flutter/material.dart';
import 'package:productivioapp/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:productivioapp/core/constants/routes.dart';


class LoginWidgets {
  static Widget buildTitle() {
    return const Text(
      'Login',
      style: TextStyle(
        fontFamily: 'DMSans',
        fontWeight: FontWeight.w600,
        fontSize: 26,
        color: Colors.black,
      ),
    );
  }

  static Widget buildEmailField(AuthViewModel authViewModel) {
    return TextField(
      controller: authViewModel.emailController,
      decoration: _buildInputDecoration(
        label: 'Email',
        prefixIcon: Icons.email,
      ),
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Color(0xFF21262C)),
    );
  }

  static Widget buildPasswordField(
      AuthViewModel authViewModel, bool obscureText, VoidCallback toggleObscureText) {
    return TextField(
      controller: authViewModel.passwordController,
      decoration: _buildInputDecoration(
        label: 'Password',
        prefixIcon: Icons.lock,
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: const Color(0xFF21262C),
          ),
          onPressed: toggleObscureText,
        ),
      ),
      obscureText: obscureText,
      style: const TextStyle(color: Color(0xFF21262C)),
    );
  }

  static Widget buildLoginButton({
    required bool isLoading,
    required VoidCallback onPressed,
    String text = 'Login',
    Color backgroundColor = const Color(0xFF21262C),
    Color textColor = Colors.white,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    double borderRadius = 24,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 16),
  }) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
      width: double.infinity, // Makes the button take full parent width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
  static Widget buildRegisterButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.register);
      },
      child: const Text(
        'Register Account',
        style: TextStyle(
          fontFamily: 'DMSans',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }

  static InputDecoration _buildInputDecoration({
    required String label,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFF21262C)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF21262C), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF21262C), width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF21262C), width: 1.5),
      ),
      prefixIcon: Icon(prefixIcon, color: const Color(0xFF21262C)),
      suffixIcon: suffixIcon,
    );
  }
}