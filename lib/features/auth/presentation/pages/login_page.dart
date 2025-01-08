import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = sl<AuthBloc>(); // Resolve the AuthBloc instance

    return BlocProvider(
      create: (context) => authBloc, // Pass the resolved AuthBloc
      child: Scaffold(
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
                  LoginWidgets.buildEmailField(authBloc), // Pass the AuthBloc instance
                  const SizedBox(height: 16),
                  LoginWidgets.buildPasswordField(authBloc), // Pass the AuthBloc instance
                  const SizedBox(height: 32),
                  LoginWidgets.buildLoginButton(authBloc), // Pass the AuthBloc instance
                  const SizedBox(height: 16),
                  LoginWidgets.buildRegisterButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}