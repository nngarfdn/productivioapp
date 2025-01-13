import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivioapp/features/auth/presentation/bloc/auth_state.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = sl<AuthBloc>();

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
                      LoginWidgets.buildTitle(),
                      const SizedBox(height: 24),
                      LoginWidgets.buildEmailField(
                        onEmailChanged: (email) =>
                            authBloc.add(EmailChanged(email)),
                      ),
                      const SizedBox(height: 16),
                      LoginWidgets.buildPasswordField(
                        onPasswordChanged: (password) =>
                            authBloc.add(PasswordChanged(password)),
                        onTogglePasswordVisibility: () =>
                            authBloc.add(const TogglePasswordVisibility()),
                        isPasswordVisible: state.isPasswordVisible,
                      ),
                      const SizedBox(height: 32),
                      LoginWidgets.buildLoginButton(
                        onLoginPressed: () =>
                            authBloc.add(const LoginSubmitted()),
                        isLoading: state.status == AuthStatus.loading,
                      ),
                      const SizedBox(height: 16),
                      LoginWidgets.buildRegisterButton(context),
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