import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(const AuthState()) {
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
      // Use the injected LoginUseCase to perform login
      final result = await loginUseCase.execute(state.email, state.password);
      print(result); // Handle success (e.g., navigate or store token)
    } catch (e) {
      // Handle error
      emit(state.copyWith(errorMessage: 'Login failed: $e'));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}