import 'dart:ffi';

import 'package:equatable/equatable.dart';
enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final String email;
  final String password;
  final String name;
  final AuthStatus status;
  final String? errorMessage;
  final bool isPasswordVisible;

  const AuthState({
    this.email = '',
    this.password = '',
    this.name = '',
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.isPasswordVisible = false,
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? name,
    AuthStatus? status,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return AuthState(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [email, password, name, status, errorMessage, isPasswordVisible];
}