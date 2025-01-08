import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

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

  static Widget buildEmailField(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context.read<AuthBloc>().add(EmailChanged(email)),
          decoration: _buildInputDecoration(
            label: 'Email',
            prefixIcon: Icons.email,
          ),
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Color(0xFF21262C)),
        );
      },
    );
  }

  static Widget buildPasswordField(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextField(
          onChanged: (password) => context.read<AuthBloc>().add(PasswordChanged(password)),
          decoration: _buildInputDecoration(
            label: 'Password',
            prefixIcon: Icons.lock,
            suffixIcon: IconButton(
              icon: Icon(
                state.password.isEmpty ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF21262C),
              ),
              onPressed: () {
                // Add toggle logic here if needed
              },
            ),
          ),
          obscureText: true,
          style: const TextStyle(color: Color(0xFF21262C)),
        );
      },
    );
  }

  static Widget buildLoginButton(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(LoginSubmitted());
            },
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
      },
    );
  }

  static Widget buildRegisterButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/register'); // Update the route as needed
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