import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<String> execute(String email, String password) {
    // Delegate to the repository
    return authRepository.login(email, password);
  }
}