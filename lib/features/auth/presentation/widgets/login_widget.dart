import 'package:flutter/material.dart';
import '../bloc/auth_bloc.dart';

typedef StateCallback = void Function(BuildContext context, AuthBloc authBloc);

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

  static Widget buildEmailField({required ValueChanged<String> onEmailChanged}) {
    return TextField(
      onChanged: onEmailChanged,
      decoration: _buildInputDecoration(
        label: 'Email',
        prefixIcon: Icons.email,
      ),
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Color(0xFF21262C)),
    );
  }

  static Widget buildPasswordField({
    required ValueChanged<String> onPasswordChanged,
    required VoidCallback onTogglePasswordVisibility,
    required bool isPasswordVisible,
  }) {
    return TextField(
      onChanged: onPasswordChanged,
      decoration: _buildInputDecoration(
        label: 'Password',
        prefixIcon: Icons.lock,
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF21262C),
          ),
          onPressed: onTogglePasswordVisibility,
        ),
      ),
      obscureText: !isPasswordVisible,
      style: const TextStyle(color: Color(0xFF21262C)),
    );
  }

  static Widget buildLoginButton({
    required VoidCallback onLoginPressed,
    required bool isLoading,
  }) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onLoginPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF21262C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static Widget buildRegisterButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/register');
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