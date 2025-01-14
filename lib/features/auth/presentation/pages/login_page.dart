import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    String email = '';
    String password = '';
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
                  if (state.status == AuthStatus.success) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Login successful'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    });
                    // Navigator.of(context).pushNamed('/home');
                  } else if (state.status == AuthStatus.failure) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage!),
                          backgroundColor: Colors.red,
                        ),
                      );
                    });
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoginWidgets.buildTitle(),
                      const SizedBox(height: 24),
                      LoginWidgets.buildEmailField(
                        onEmailChanged: (value) => email = value,
                      ),
                      const SizedBox(height: 16),
                      LoginWidgets.buildPasswordField(
                        onPasswordChanged: (value) => password = value,
                        onTogglePasswordVisibility: () =>
                            authBloc.add(const TogglePasswordVisibility()),
                        isPasswordVisible: state.isPasswordVisible,
                      ),
                      const SizedBox(height: 32),
                      LoginWidgets.buildLoginButton(
                        onLoginPressed: () {
                          authBloc.add(EmailChanged(email));
                          authBloc.add(PasswordChanged(password));
                          authBloc.add(const LoginSubmitted());
                        },
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
