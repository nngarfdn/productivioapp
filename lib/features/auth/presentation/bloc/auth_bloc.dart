import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<AuthState> emit) async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(state.copyWith(errorMessage: 'Email and password cannot be empty.'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      // Handle success (e.g., navigate or store token)
      print('Login successful with email: ${state.email}');
    } catch (e) {
      // Handle error
      emit(state.copyWith(errorMessage: 'Login failed: $e'));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}