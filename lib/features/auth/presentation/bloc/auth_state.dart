import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.errorMessage,
  });

  AuthState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, isLoading, errorMessage];
}