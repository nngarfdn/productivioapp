import 'package:flutter/material.dart';
import 'package:productivioapp/features/auth/presentation/widgets/login_widget.dart';
import 'package:provider/provider.dart';
import 'package:productivioapp/features/auth/presentation/viewmodel/auth_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoginWidgets.buildTitle(),
                const SizedBox(height: 24),
                LoginWidgets.buildEmailField(authViewModel),
                const SizedBox(height: 16),
                LoginWidgets.buildPasswordField(
                  authViewModel,
                  _obscureText,
                  _toggleObscureText,
                ),
                const SizedBox(height: 32),
                LoginWidgets.buildLoginButton(
                  isLoading: authViewModel.isLoading,
                  onPressed: authViewModel.login,
                ),
                const SizedBox(height: 16),
                LoginWidgets.buildRegisterButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}