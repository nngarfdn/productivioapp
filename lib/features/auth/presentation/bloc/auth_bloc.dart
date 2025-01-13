import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/model/resource.dart';
import '../../domain/usecases/login_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(const AuthState()) {
    on<EmailChanged>(_onEmailChanged);
    on<NameChanged>(_onNameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<ResetAuth>(_onResetAuth);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
  }

  void _onNameChanged(NameChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onTogglePasswordVisibility(TogglePasswordVisibility event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onEmailChanged(EmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event,
      Emitter<AuthState> emit,
      ) async {
    print("LoginSubmitted event triggered");

    if (state.email.isEmpty || state.password.isEmpty) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'Email and password cannot be empty.',
      ));
      return;
    }

    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final result = await loginUseCase.execute(state.email, state.password);

    if (result is Success<User>) {
      print("loginstatus: ${result.data}");
      emit(state.copyWith(
        status: AuthStatus.success,
        errorMessage: null,
      ));
    } else if (result is Error<User>) {
      print("loginstatus: ${result.message}");
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: result.message,
      ));
    }
  }

  void _onResetAuth(ResetAuth event, Emitter<AuthState> emit) {
    emit(const AuthState()); // Reset the state to default values
  }
}