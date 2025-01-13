import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/model/resource.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Resource<User>> execute(String email, String password) {
    return authRepository.login(email, password);
  }
}