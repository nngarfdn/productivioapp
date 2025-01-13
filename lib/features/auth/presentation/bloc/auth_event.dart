import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends AuthEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class NameChanged extends AuthEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class PasswordChanged extends AuthEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends AuthEvent {
  const LoginSubmitted();
}

class ResetAuth extends AuthEvent {
  const ResetAuth();
  @override
  List<Object?> get props => [];
}

class TogglePasswordVisibility extends AuthEvent {
  const TogglePasswordVisibility();
}