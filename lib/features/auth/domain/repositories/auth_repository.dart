import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/model/resource.dart';

abstract class AuthRepository {
  Future<Resource<User>> login(String email, String password);
}