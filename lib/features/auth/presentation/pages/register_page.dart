import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivioapp/core/widgets/general_toolbar.dart';

import '../../../../injection.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/register_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = sl<AuthBloc>(); // Resolve the AuthBloc instance

    return BlocProvider(
      create: (context) => authBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RegisterWidgets.buildTitle(),
                      const SizedBox(height: 24),
                      RegisterWidgets.buildNameField(
                        onNameChanged: (name) =>
                            authBloc.add(NameChanged(name)),
                      ),
                      const SizedBox(height: 16),
                      RegisterWidgets.buildEmailField(
                        onEmailChanged: (email) =>
                            authBloc.add(EmailChanged(email)),
                      ),
                      const SizedBox(height: 16),
                      RegisterWidgets.buildPasswordField(
                        onPasswordChanged: (password) =>
                            authBloc.add(PasswordChanged(password)),
                        onTogglePasswordVisibility: () =>
                            authBloc.add(const TogglePasswordVisibility()),
                        isPasswordVisible: state.isPasswordVisible,
                      ),
                      const SizedBox(height: 32),
                      RegisterWidgets.buildRegisterButton(
                        onRegisterPressed: () =>
                            {},
                        isLoading: state.status == false,
                      ),
                      const SizedBox(height: 16),
                      RegisterWidgets.buildLoginRedirectButton(context),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}