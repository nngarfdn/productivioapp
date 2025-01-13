import 'package:firebase_auth/firebase_auth.dart';
import 'package:productivioapp/features/auth/data/remote_data_source.dart';
import '../../../core/model/resource.dart';
import '../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Resource<User>> login(String email, String password) {
    return remoteDataSource.authenticate(email, password);
  }
}
